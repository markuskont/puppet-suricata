# == Class suricata::params
#
# This class is meant to be called from suricata
# It sets variables according to platform
#
class suricata::params {
  $ruleset = 'emerging'
  $threads = $::processorcount
  $scirius_admin = 'admin'
  $scirius_admin_pass = 'changeme'
  $scirius_admin_mail = 'admin@dummy.com'
  $scirius_ruleset_name = 'ETpro'
  $scirius_ruleset_url = 'https://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz'

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
