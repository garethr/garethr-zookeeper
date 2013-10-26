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

  context 'When asked not to include an external repo' do
    let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }
    let(:params) { {:use_external_repo => false} }
    it { should_not include_class('wget') }
    it { should_not include_class('java') }
    it { should_not contain_package('cloudera_repo') }
  end

  context 'When given a bogus falue for use_external_repo' do
    let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }
    let(:params) { {:use_external_repo => 'false'} }
    it { expect { subject }.to raise_error() }
  end

end
