exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    user    => 'root',
    group   => 'root',
}

$apt_packages = [
    "vim",
    "git",
    "mercurial",
    "exuberant-ctags",
    "maven",
    "ant",
    "subversion",
    "openjdk-7-jdk",
]

$vagrant_path = [
             "/usr/local/sbin",
             "/usr/local/bin",
             "/usr/sbin",
             "/usr/bin",
             "/sbin",
             "/bin",
             "/usr/games",
             "/opt/vagrant_ruby/bin"]

package { $apt_packages:
    ensure => present,
    require => Exec['apt-get update'],
}

file_line { "7 jdk java_home":
    path    => "/etc/environment",
    line    => "JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386",
    require => Package["openjdk-7-jdk"],
}

file { "/home/vagrant/.ant":
    ensure => directory,
    mode   => 0644,
    owner  => "vagrant",
    group  => "vagrant",
}

file { "/home/vagrant/.ant/lib":
    ensure => directory,
    mode   => 0644,
    owner  => "vagrant",
    group  => "vagrant",
}

Exec {
    user    => "vagrant",
    group   => "vagrant",
    path    => $vagrant_path,
}

exec { "install junit":
    command => "wget http://search.maven.org/remotecontent?filepath=junit/junit/4.8/junit-4.8.jar -O junit-4.8.jar",
    creates => '/home/vagrant/.ant/lib/junit-4.8.jar',
    cwd     => '/home/vagrant/.ant/lib',
}

exec { 'copy source' :
    command => "git clone git://github.com/OpenGrok/OpenGrok.git",
    cwd => '/home/vagrant',
    creates => '/home/vagrant/OpenGrok',
    require => Package["git"],
}

exec { 'get jflex' :
    require => Exec['copy source'],
    command => 'wget http://jflex.de/jflex-1.4.3.tar.gz; tar -zxf jflex-1.4.3.tar.gz; mv jflex/lib/JF* .; rm -r jflex*',
    creates => '/home/vagrant/OpenGrok/lib/JFlex.jar',
    cwd     => '/home/vagrant/OpenGrok/lib',
}

