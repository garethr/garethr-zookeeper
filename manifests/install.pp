class zookeeper::install {
  include wget
  include java

  wget::fetch { 'download_cloudera_repo':
    source      => 'http://archive.cloudera.com/cdh4/one-click-install/precise/amd64/cdh4-repository_1.0_all.deb',
    destination => '/usr/local/src/cdh4-repository_1.0_all.deb',
    before      => Package['cloudera_repo'],
  }

  package { 'cloudera_repo':
    ensure   => installed,
    source   => '/usr/local/src/cdh4-repository_1.0_all.deb',
    provider => dpkg,
    notify   => Exec['apt-update-cloudera'];
  }

  exec { 'apt-update-cloudera':
    command     => '/usr/bin/apt-get update',
    refreshonly => true;
  }

  package { [
    'zookeeper',
    'zookeeper-server',
  ]:
    ensure  => installed,
    require => Exec['apt-update-cloudera'],
  }

}
