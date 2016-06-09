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
  $package_name             = $suricata::params::package_name,
  $service_name             = $suricata::params::service_name,
  $home_net                 = $suricata::params::home_net,
  $monitor_interface        = $suricata::params::monitor_interface,
  $monitor_interface_array  = undef,
  $scirius                  = $suricata::params::scirius,
  $rule_dir                 = $suricata::params::rule_dir,
  $rule_files               = $suricata::params::rule_files,
  $scirius_ruleset_name     = $suricata::params::scirius_ruleset_name,
  $threads                  = $suricata::params::threads,
  $log_dns                  = $suricata::params::log_dns,
  $log_http                 = $suricata::params::log_http,
  $log_files                = $suricata::params::log_files,
  $log_tls                  = $suricata::params::log_tls,
  $log_smtp                 = $suricata::params::log_smtp,
  $log_ssh                  = $suricata::params::log_ssh,
  $log_flow                 = $suricata::params::log_flow,
  $log_netflow              = $suricata::params::log_netflow,
) inherits suricata::params {
  # validate parameters

  validate_string($package_name)
  validate_string($service_name)
  validate_string($home_net)
  validate_string($monitor_interface)
  validate_array($monitor_interface_array)
  validate_bool($scirius)
  validate_absolute_path($rule_dir)
  validate_array($rule_files)
  validate_string($scirius_ruleset_name)
  validate_integer($threads)
  validate_bool($log_dns)
  validate_bool($log_http)
  validate_bool($log_files)
  validate_bool($log_tls)
  validate_bool($log_smtp)
  validate_bool($log_ssh)
  validate_bool($log_flow)
  validate_bool($log_netflow)

  include apt

  if $suricata::monitor_interface_array {
    $suricata::monitor_interface_array.each |String $suricata_interface| {
      if ! $suricata_interface in $::interfaces {
        notice "${suricata_interface} not present"
        notice "Available interfaces: ${::interfaces}"
        fail('Please use a available interface')
      }
    }
  } elsif ! $suricata::monitor_interface in $::interfaces {
    notice "${monitor_interface} not present"
    notice "Available interfaces: ${::interfaces}"
    fail('Please use a available interface')
  }
  class { 'suricata::install': } ->
  class { 'suricata::config': } ~>
  class { 'suricata::service': } ->
  Class['suricata']
}
