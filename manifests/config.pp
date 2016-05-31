# == Class suricata::config
#
# This class is called from suricata
#
class suricata::config inherits suricata {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  # disable offloading
  # generic-receive-offload
  exec { 'disable_gro':
    command => "/sbin/ethtool -K ${monitor_interface} gro off",
    unless  => "/sbin/ethtool -k ${monitor_interface} | egrep 'generic-receive-offload: (off|on \[fixed\])'",
  }
  # rx-vlan-offload
  exec { 'disable_rxvlan':
    command => "/sbin/ethtool -K ${monitor_interface} rxvlan off",
    unless  => "/sbin/ethtool -k ${monitor_interface} | egrep 'rx-vlan-offload: (off|on \[fixed\])'",
  }
  # generic-segmentation-offload
  exec { 'disable_gso':
    command => "/sbin/ethtool -K ${monitor_interface} gso off",
    unless  => "/sbin/ethtool -k ${monitor_interface} | egrep 'generic-segmentation-offload: (off|on \[fixed\])'",
  }
  # tcp-segmentation-offload
  exec { 'disable_sg':
    command => "/sbin/ethtool -K ${monitor_interface} sg off",
    unless  => "/sbin/ethtool -k ${monitor_interface} | egrep 'tcp-segmentation-offload: (off|on \[fixed\])'",
  }
  # rx-checksumming
  exec { 'disable_rx':
    command => "/sbin/ethtool -K ${monitor_interface} rx off",
    unless  => "/sbin/ethtool -k ${monitor_interface} | egrep 'rx-checksumming: (off|on \[fixed\])'",
  }

  # set promisc mode
  exec { 'set_promisc':
    command => "/sbin/ifconfig ${monitor_interface} promisc",
    unless  => "/sbin/ifconfig ${monitor_interface} | grep 'PROMISC'",
  }

  # enable interface
  exec { 'set_enable':
    command => "/sbin/ifconfig ${monitor_interface} up",
    unless  => "/sbin/ifconfig ${monitor_interface} | grep 'UP'",
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
