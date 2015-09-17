# == Class suricata::oinkmaster::install
#
class suricata::oinkmaster::install {
  # install oinkmaster
  package { 'oinkmaster':
    ensure => installed,
  }
  # create etpro rules dir
  file{ 'etprodir':
    ensure => directory,
    path   => '/etc/suricata/rules/etpro',
  }
  # create emerging rules dir
  file{ 'emergingdir':
    ensure => directory,
    path   => '/etc/suricata/rules/emerging',
  }

}

