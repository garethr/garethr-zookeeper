class zookeeper::service {
  if $::zookeeper::use_external_repo == true {
    $service_name = 'zookeeper-server'
  } else {
    $service_name = 'zookeeper'
  }

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

