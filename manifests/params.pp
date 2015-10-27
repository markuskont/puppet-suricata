# == Class suricata::params
#
# This class is meant to be called from suricata
# It sets variables according to platform
#
class suricata::params {
  $ruleset = 'emerging'
  $home_net = '192.168.0.0/16,10.0.0.0/8,172.16.0.0/12'
  $threads = $::processorcount
  $scirius_ruleset_name = 'ETpro'

  case $::osfamily {
    'Debian': {
      $package_name = 'suricata'
      $service_name = 'suricata'
      $monitor_interface = 'eth1'
    }
    'RedHat', 'Amazon': {
      $package_name = 'suricata'
      $service_name = 'suricata'
      $monitor_interface = 'eth1'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
