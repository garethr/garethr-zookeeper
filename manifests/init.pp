class zookeeper {
  class{'zookeeper::install': } ->
  class{'zookeeper::config': } ~>
  class{'zookeeper::service': } ->
  Class['zookeeper']
}
