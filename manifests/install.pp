# == Class suricata::install
#
class suricata::install {
  package { ['software-properties-common', 'python-software-properties' ]:
    ensure => installed,
  }
  # install suricata repo
  apt::ppa{ 'ppa:oisf/suricata-stable':
    require => Package['python-software-properties'],
  } ->
  # install package
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
