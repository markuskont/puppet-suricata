# == Class suricata::install
#
class suricata::install {
  $packages = [
    'software-properties-common',
    'python-software-properties',
    'ethtool',
    'libhtp1',
    'python-pyinotify',
  ]
  ensure_packages($packages)
  # install suricata repo
  apt::ppa{ 'ppa:oisf/suricata-stable':
    require => Package['python-software-properties'],
  }
  # install package
  package { $suricata::package_name:
    ensure  => latest,
    require => Apt::Ppa['ppa:oisf/suricata-stable'],
  }
}
