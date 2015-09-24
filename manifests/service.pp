# == Class suricata::service
#
# This class is meant to be called from suricata
# It ensure the service is running
#
class suricata::service {
  # service irqbalance stop
  service { 'irqbalance':
    ensure => stopped,
    enable => false,
  }
  # start service, do not enable at boot
  service { $suricata::service_name:
    ensure     => running,
    enable     => false,
    hasstatus  => false,
    pattern    => '/usr/bin/suricata',
  }
}
