# == Class suricata::service
#
# This class is meant to be called from suricata
# It ensure the service is running
#
class suricata::service {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  # service irqbalance stop
  service { 'irqbalance':
    ensure => stopped,
    enable => false,
  }

  # start service, do not enable at boot to wait for puppet to config nic
  service { $suricata::service_name:
    ensure    => running,
    enable    => false,
    hasstatus => false,
    pattern   => '/usr/bin/suricata',
  }
}
