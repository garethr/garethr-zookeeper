class zookeeper::install {
  validate_bool($::zookeeper::use_external_repo)

  if $::zookeeper::use_external_repo == true {
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
      refreshonly => true,
      before      => [ Package['zookeeper'], Package['zookeeper-server'] ],
    }
  }

  package { [
    'zookeeper',
    'zookeeper-server',
  ]:
    ensure  => installed,
  }

}
