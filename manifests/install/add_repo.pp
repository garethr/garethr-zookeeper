class zookeeper::install::add_repo {

  case $::osfamily {
    default: { fail("unsupported platform ${::osfamily}") }
    'Linux': {
      case $::operatingsystem {
        default: { fail("unsupported os ${::operatingsystem}") }
        'Amazon': {
          wget::fetch { 'download_cloudera_repo':
            source      => 'http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/cloudera-cdh4.repo',
            destination => '/etc/yum.repos.d/cloudera-cdh4.repo',
          }
          exec { 'add_cloudera_key':
            command => 'rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera',
          }
        }
      }
    }
    'RedHat': {
      case $::operatingsystem {
        default: { fail("unsupported os ${::operatingsystem}") }
        'RedHat', 'CentOS', 'OracleLinux', 'Scientific': {
          wget::fetch { 'download_cloudera_repo':
            source      => 'http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/cloudera-cdh4.repo',
            destination => '/etc/yum.repos.d/cloudera-cdh4.repo',
          }
          exec { 'add_cloudera_key':
            command => 'rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera',
          }
        }
      }
    }
    'Debian': {
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
    }
  }

}
