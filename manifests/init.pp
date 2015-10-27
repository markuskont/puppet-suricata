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
  $threads = $suricata::params::threads,
  $scirius_admin = $suricata::params::scirius_admin,
  $scirius_admin_pass = $suricata::params::scirius_admin_pass,
  $scirius_admin_mail = $suricata::params::scirius_admin_mail,
  $scirius_ruleset_name = $suricata::params::scirius_ruleset_name,
  $scirius_ruleset_url = $suricata::params::scirius_ruleset_url,
  $scirius_ruleset_update = $suricata::params::scirius_ruleset_update,
  $scirius_es_address = $suricata::params::scirius_es_address,
  $scirius_es_index = $suricata::params::scirius_es_index,
  $scirius_kibana_url = $suricata::params::scirius_kibana_url,
  $scirius_kibana_index = $suricata::params::scirius_kibana_index,
  $scirius_kibana_version = $suricata::params::scirius_kibana_version,
) inherits suricata::params {

  include apt

  # validate parameters here
  if $suricata::monitor_interface in $::interfaces {
    class { 'suricata::install': } ->
    class { 'suricata::scirius::install': } ->
    class { 'suricata::scirius::config': } ->
    class { 'suricata::config': } ~>
    class { 'suricata::service': } ->
    class { 'suricata::scirius::service': } ->
    Class['suricata']
  } else {
    notice "${monitor_interface} not present"
    notice "Available interfaces: ${::interfaces}"
    fail('Please use a available interface')
  }
}
