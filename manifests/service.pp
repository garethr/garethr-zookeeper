class zookeeper::service {
  service { 'zookeeper-server':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

