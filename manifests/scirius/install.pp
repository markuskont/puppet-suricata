# == Class suricata::scirius::install
#
class suricata::scirius::install {
  # install django
  $packages = [
    'python-django',
    'python-imaging',
    'python-pythonmagick',
    'python-markdown',
    'python-textile',
    'python-docutils',
    'python-pip',
    'python-dev'
  ]
  ensure_packages($packages)



#  # create etpro rules dir
#  file{ 'etprodir':
#    ensure => directory,
#    path   => '/etc/suricata/rules/etpro',
#  }
  # create emerging rules dir
#  file{ 'emergingdir':
#    ensure => directory,
#    path   => '/etc/suricata/rules/emerging',
#  }

}

