A Puppet module for managing the installation of Zookeeper from
Cloudera.
[![Build
Status](https://secure.travis-ci.org/garethr/garethr-zookeeper.png)](http://travis-ci.org/garethr/garethr-zookeeper)

# Usage

For the moment this is as simple as

    include zookeeper

Which will install zookeeper using the upstream Cloudera repositories.

To install using system packages instead of using the external Cloudera repo:

    class { 'zookeeper':
      use_external_repo => false,
    }

All other configuration is down to you.

# Requirements

If using the Cloudera repository, you will need the wget and java modules
(or similarly named and functioning modules) to provide dependencies for 
either the build or running of zookeeper. 

If you use_external_repo is false, installing dependent packages is left up
to the system package manager.
