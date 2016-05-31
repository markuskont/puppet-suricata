# == Class suricata::params
#
# This class is meant to be called from suricata
# It sets variables according to platform
#
class suricata::params {
  $ruleset = 'emerging'
  $home_net = '192.168.0.0/16,10.0.0.0/8,172.16.0.0/12'
  $threads = $::processorcount
  $rule_dir = '/etc/suricata/rules'
  $rule_files = [
    'botcc.rules',
    'ciarmy.rules',
    'compromised.rules',
    'drop.rules',
    'dshield.rules',
    'emerging-activex.rules',
    'emerging-attack_response.rules',
    'emerging-chat.rules',
    'emerging-current_events.rules',
    'emerging-dns.rules',
    'emerging-dos.rules',
    'emerging-exploit.rules',
    'emerging-ftp.rules',
    'emerging-games.rules',
    'emerging-icmp_info.rules',
    'emerging-icmp.rules',
    'emerging-imap.rules',
    'emerging-inappropriate.rules',
    'emerging-malware.rules',
    'emerging-misc.rules',
    'emerging-mobile_malware.rules',
    'emerging-netbios.rules',
    'emerging-p2p.rules',
    'emerging-policy.rules',
    'emerging-pop3.rules',
    'emerging-rpc.rules',
    'emerging-scada.rules',
    'emerging-scan.rules',
    'emerging-shellcode.rules',
    'emerging-smtp.rules',
    'emerging-snmp.rules',
    'emerging-sql.rules',
    'emerging-telnet.rules',
    'emerging-tftp.rules',
    'emerging-trojan.rules',
    'emerging-user_agents.rules',
    'emerging-voip.rules',
    'emerging-web_client.rules',
    'emerging-web_server.rules',
    'emerging-web_specific_apps.rules',
    'emerging-worm.rules',
    'tor.rules'
  ]
  $scirius = false
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
