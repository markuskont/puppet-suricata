# == Class: suricata
#
# Full description of class suricata here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class suricata (
  $package_name = $suricata::params::package_name,
  $service_name = $suricata::params::service_name,
  $monitor_interface = $suricata::params::monitor_interface,
  $scirius_ruleset_name = $suricata::params::scirius_ruleset_name,
  $threads = $suricata::params::threads,
) inherits suricata::params {
  # validate parameters
  validate_string($package_name)
  validate_string($service_name)
  validate_string($monitor_interface)
  validate_string($scirius_ruleset_name)
  validate_integer($threads)

  include apt

  if $suricata::monitor_interface in $::interfaces {
    class { 'suricata::install': } ->
    class { 'suricata::config': } ~>
    class { 'suricata::service': } ->
    Class['suricata']
  } else {
    notice "${monitor_interface} not present"
    notice "Available interfaces: ${::interfaces}"
    fail('Please use a available interface')
  }
}
