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
    ensure    => running,
    enable    => false,
    hasstatus => false,
    pattern   => '/usr/bin/suricata',
  }
  # create suricataboot.sh
  file{ 'suricataboot':
    path    => '/usr/local/bin/suricataboot.sh',
    content => template('suricata/suricataboot.sh.erb'),
    mode    => '0544',
  }
  # run puppet at startup to configure and run suricata
  cron { 'suricataboot':
    command => '/usr/local/bin/suricataboot.sh',
    user    => root,
    special => reboot,
  }
}
