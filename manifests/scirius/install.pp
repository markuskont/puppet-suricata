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
    'python-dev',
    'python-pyinotify'
  ]
  ensure_packages($packages)
  # clone scirius repo
  vcsrepo { '/opt/scirius':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/StamusNetworks/scirius.git',
  } ~>
  # install requierements
  exec { 'install requirements':
    command     => '/usr/bin/pip install -r /opt/scirius/requirements.txt',
    refreshonly => true,
  }
  # install new db if not exist
  exec { 'initial_syncdb':
    command => '/usr/bin/python manage.py syncdb --no-initial-data --noinput',
    creates => '/opt/scirius/db.sqlite3',
    cwd     => '/opt/scirius',
  }
}

