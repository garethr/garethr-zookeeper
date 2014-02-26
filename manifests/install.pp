class zookeeper::install {
  include wget
  include java

  class { "zookeeper::install::add_repo": } ->
  package { [
    'zookeeper',
    'zookeeper-server',
  ]:
    ensure  => installed,
  }
}
