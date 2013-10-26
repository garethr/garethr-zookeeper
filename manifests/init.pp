class zookeeper (
  $use_external_repo = true
) inherits zookeeper::params {
  class{'zookeeper::install': } ->
  class{'zookeeper::config': } ~>
  class{'zookeeper::service': } ->
  Class['zookeeper']
}
