# == Class suricata::install
#
class suricata::install {

  apt::ppa{ 'ppa:oisf/suricata-stable': } ->

  package { $suricata::package_name:
    ensure => latest,
  }
  # install ethtool
  package { 'ethtool':
    ensure => latest,
  }
  # install http lib
  package { 'libhtp1':
    ensure => latest,
  }
}
