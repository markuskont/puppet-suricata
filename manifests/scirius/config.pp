# == Class suricata::scirius::config
#
class suricata::scirius::config {
  # install packages
  $packages = [
    'expect',
  ]
  ensure_packages($packages)

  # only trigger creation of users, sources, rulesets if new db is created
  exec { 'scirius_admin_user':
    command     => '/usr/bin/expect create_scirius_user.exp',
    refreshonly => true,
    cwd         => '/opt/scirius',
    subscribe   => [ File['create scirius expect'], Exec['initial_syncdb'] ],
  }
  exec { 'scirius_ruleset':
    command     => "/usr/bin/python manage.py addsource ${suricata::params::scirius_ruleset_name} ${suricata::params::scirius_ruleset_url} http sigs",
    refreshonly => true,
    cwd         => '/opt/scirius',
    subscribe   => [ File['create scirius expect'], Exec['initial_syncdb'] ],
  }
  exec { 'scirius_defaultruleset':
    command     => "/usr/bin/python manage.py defaultruleset ${suricata::params::scirius_ruleset_name}",
    refreshonly => true,
    cwd         => '/opt/scirius',
    subscribe   => Exec['scirius_ruleset'],
  }
  exec { 'scirius_addsuricata':
    command     => "/bin/sleep 5;/usr/bin/python manage.py addsuricata IDS 'Puppet installed' /etc/suricata/rules/${suricata::params::scirius_ruleset_name} ${suricata::params::scirius_ruleset_name}",
    refreshonly => true,
    cwd         => '/opt/scirius',
    subscribe   => Exec['scirius_ruleset'],
  }
}

