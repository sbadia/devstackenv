# Author:: Sebastien Badia (<sebastien.badia@enovance.com>)
# Date:: 2013-09-23 15:05:34 +0200

class { 'apt':
  always_apt_update    => false,
  proxy_host           => '10.0.2.2',
  proxy_port           => '3142',
}

exec {
  'apt-update':
    command   => '/usr/bin/apt-get update',
    user      => root,
    logoutput => 'on_failure',
    onlyif    => ['test -x /usr/bin/apt-get', 'test `find "/var/lib/apt/lists" -maxdepth 0 -mtime +7`'],
    path      => '/bin:/usr/bin';
}


package {
  ['git','libxml2-dev','libxslt1-dev','libpq-dev','python-pip','libsqlite3-dev']:
    ensure  => installed,
    require => Exec['apt-update'];
}

apt::builddep {
  'python-mysqldb':
}
