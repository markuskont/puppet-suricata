# == Class suricata::install
#
class suricata::install {

  apt::ppa{ 'ppa:oisf/suricata-stable': } ->

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
