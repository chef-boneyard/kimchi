require 'spec_helper'

describe 'kimchi::default' do
  describe service('libvirtd') do
    it { should be_running }
  end

  describe service('kimchid') do
    it { should be_running }
  end

  describe iptables do
    it { should have_rule('-A INPUT -p tcp -m tcp --dport 8000 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m tcp --dport 8001 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m tcp --dport 64667 -j ACCEPT') }
  end
end
