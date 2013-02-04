
package { "python-software-properties":
    ensure => present,
}

exec { 'add oracle ppa':
    command => 'add-apt-repository ppa:webupd8team/java',
    path => [
             "/usr/local/sbin",
             "/usr/local/bin",
             "/usr/sbin",
             "/usr/bin",
             "/sbin",
             "/bin",
             "/usr/games",
             "/opt/vagrant_ruby/bin"],
    require => Package['python-software-properties'],
}

exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    require => Exec['add oracle ppa'],
}

package { "vim":
    ensure => present,
    require => Exec['apt-get update'],
}

/*  Oracle has a license agreement that blocks Puppet. try to get openjdk working
package { "oracle-jdk7-installer":
    ensure => present,
    require => Exec['apt-get update'],
}
*/

package { "git":
    ensure => present,
    require => Exec['apt-get update'],
}

package { "ant":
    ensure => present,
    require => Exec['apt-get update'],
}

package { "maven":
    ensure => present,
    require => Exec['apt-get update'],
}

exec { 'copy source' :
    command => "/bin/su vagrant -c '/bin/cp -r /vagrant/OpenGrok /home/vagrant/'",
    creates => '/home/vagrant/OpenGrok',
}

exec { 'get jflex' :
    require => Exec['copy source'],
    command => 'wget http://jflex.de/jflex-1.4.3.tar.gz; tar -zxf jflex-1.4.3.tar.gz; mv jflex/lib/JF* .; rm -r jflex*',
    creates => '/home/vagrant/OpenGrok/lib/JFlex.jar',
    cwd => '/home/vagrant/OpenGrok/lib',
    path => [
             "/usr/local/sbin",
             "/usr/local/bin",
             "/usr/sbin",
             "/usr/bin",
             "/sbin",
             "/bin",
             "/usr/games",
             "/opt/vagrant_ruby/bin"],
}

