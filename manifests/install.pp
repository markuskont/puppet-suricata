# == Class suricata::install
#
class suricata::install {
  package { 'python-software-properties':
    ensure => installed,
  }

  apt::ppa{ 'ppa:oisf/suricata-stable':
    require => Package['python-software-properties'],
  } ->

  package { $suricata::package_name:
    ensure => installed,
  }
  # install ethtool
  package { 'ethtool':
    ensure => installed,
  }
  # install http lib
  package { 'libhtp1':
    ensure => installed,
  }

}
