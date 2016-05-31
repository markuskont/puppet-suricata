# == Class suricata::install
#
class suricata::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  # install packages
  $packages = [
    'software-properties-common',
    'python-software-properties',
    'ethtool',
    'python-pyinotify',
  ]
  ensure_packages($packages)

  # install suricata repo
  case $::osfamily {
    'Debian': {
      case $::os['release']['major'] {
        '7': {
          fail('Libc on wheezy is outdated and thus suricata >= 2 is not supported')
        }
        '8': {
          apt::source { 'oisf':
            comment     =>  'Suricata OSIF stable repository',
            location    =>  'http://ppa.launchpad.net/oisf/suricata-stable/ubuntu',
            release     =>  'xenial',
            repos       =>  'main',
            key         =>  {
              'id'      =>  '9F6FC9DDB1324714B78062CBD7F87B2966EB736F',
              'server'  =>  'keyserver.ubuntu.com'
            }
          } ->
          # update apt
          exec { 'apt-update':
            command     => '/usr/bin/apt-get update',
            refreshonly => true,
          } ->
          # install suricata package
          package {'libhtp1': ensure  => latest } ->
          package { $suricata::package_name: ensure  => latest }
        }
      }
    }
    'Ubuntu': {
      apt::ppa{ 'ppa:oisf/suricata-stable':
        require => Package['python-software-properties'],
      } ->
      # update apt
      exec { 'apt-update':
        command     => '/usr/bin/apt-get update',
        refreshonly => true,
      } ->
      # install suricata package
      package {'libhtp1': ensure  => latest } ->
      package { $suricata::package_name: ensure  => latest }
    }
  }
}
