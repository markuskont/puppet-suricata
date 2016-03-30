# == Class suricata::config
#
# This class is called from suricata
#
class suricata::config {
# disable offloading
# generic-receive-offload
  exec { 'disable_gro':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} gro off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'generic-receive-offload: off'",
  }
# rx-vlan-offload
  exec { 'disable_rxvlan':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} rxvlan off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'rx-vlan-offload: off'",
  }
# generic-segmentation-offload
  exec { 'disable_gso':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} gso off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'generic-segmentation-offload: off'",
  }
# tcp-segmentation-offload
  exec { 'disable_sg':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} sg off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'tcp-segmentation-offload: off'",
  }
# rx-checksumming
  exec { 'disable_rx':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} rx off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'rx-checksumming: off'",
  }
# set promisc mode
  exec { 'set_promisc':
    command => "/sbin/ifconfig ${suricata::monitor_interface} promisc",
    unless  => "/sbin/ifconfig ${suricata::monitor_interface} | grep 'PROMISC'",
  }
# set mtu size 
#  exec { 'set_mtusize':
#    command => "/sbin/ifconfig ${suricata::monitor_interface} mtu 9261",
#    unless  => "/sbin/ifconfig ${suricata::monitor_interface} | grep 'MTU:9261'",
#  }
# enable interface
  exec { 'set_enable':
    command => "/sbin/ifconfig ${suricata::monitor_interface} up",
    unless  => "/sbin/ifconfig ${suricata::monitor_interface} | grep 'UP'",
  }
# create logdir
  file{ 'logdir':
    ensure => directory,
    path   => '/var/log/suricata',
  }
# create suricata configs
  file{ 'suricata-default':
    path    => '/etc/default/suricata',
    content => template('suricata/suricata-default.erb'),
  }
  file{ 'suricata.yaml':
    path    => '/etc/suricata/suricata.yaml',
    content => template('suricata/suricata.yaml.erb'),
  }
}
