
package {['initscripts']:}

class {['apache']:

}

class {['epel']:
}

package {['python-pip']:
  require => Class["epel"]
}

file { '/usr/bin/pip-python':
    ensure => 'link',
    target => '/usr/bin/pip',
}

package {'flask':
  provider => "pip",
  require => [ Package["python-pip"], File["/usr/bin/pip-python"] ]
}

class {'apache::mod::wsgi':
  wsgi_python_path            => '/var/www/service',
}

apache::vhost { 'testws.ucl.ac.uk':
  docroot                     => '/var/www/service',
  wsgi_import_script          => '/var/www/service/app.wsgi',
  wsgi_script_aliases         => { '/' => '/var/www/service/app.wsgi' },
  ip                          => "*",
  port                        => "80",
  add_listen                  => false
}

service {'firewalld':
  ensure => "stopped"
}
