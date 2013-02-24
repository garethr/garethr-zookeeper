require 'spec_helper'

describe 'zookeeper', :type => :class do

  context 'no parameters' do
    let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }

    it { should include_class('wget') }
    it { should include_class('java') }
    it { should contain_package('zookeeper').with_ensure('installed')}
    it { should contain_package('zookeeper-server').with_ensure('installed')}
    it { should create_class('zookeeper::config')}
    it { should create_class('zookeeper::install')}
    it { should create_class('zookeeper::service')}

    it { should contain_service('zookeeper-server').with_ensure('running').with_enable('true') }
  end

end
