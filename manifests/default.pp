exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
}

package { "vim":
    ensure => present,
    require => Exec['apt-get update'],
       
}

package { "git":
    ensure => present,
    require => Exec['apt-get update'],
}

exec { 'copy source' :
    command => '/bin/cp -r /vagrant/OpenGrok /home/vagrant/',
    creates => '/home/vagrant/OpenGrok',
}
