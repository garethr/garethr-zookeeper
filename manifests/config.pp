class zookeeper::config {
  $service_cmd = $::operatingsystem ? {
    /(?i)(amazon|redhat|centos)/ => "zookeeper-server",
    default => "zookeeper-service"
  }
  exec { 'initialize_zookeeper':
    command => "service $service_cmd init",
    creates => '/var/lib/zookeeper/version-2',
  }
}
