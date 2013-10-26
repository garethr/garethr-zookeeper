class zookeeper::config {
  exec { 'initialize_zookeeper':
    command => 'service zookeeper-service init',
    creates => '/var/lib/zookeeper/version-2',
    path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
  }
}
