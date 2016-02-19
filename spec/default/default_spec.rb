#
# Cookbook Name:: kimchi
# Spec:: default
#
# Copyright 2015, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

describe 'kimchi::default' do
  context 'When all attributes are default, on centos-6.6' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '6.6'
      )
      runner.converge(described_recipe)
    end

    it 'installs prequisite packages' do
      expect(chef_run).to install_package('dependencies').with(package_name: %w( gcc make autoconf automake gettext-devel git python-cherrypy python-cheetah libvirt-python libvirt python-imaging PyPAM m2crypto python-jsonschema rpm-build qemu-kvm python-psutil python-ethtool sos python-ipaddr python-ldap python-lxml nfs-utils iscsi-initiator-utils libxslt pyparted nginx python-libguestfs libguestfs-tools python-websockify novnc spice-html5 python-unittest2 python-ordereddict ))
    end

    # Only on RHEL
    it 'enables and starts libvirt' do
      expect(chef_run).to enable_service('libvirtd')
      expect(chef_run).to start_service('libvirtd')
    end

    it 'syncs a git with attributes' do
      expect(chef_run).to sync_git('/var/chef/cache/kimchi').with(repository: 'git://github.com/kimchi-project/kimchi')
    end

    it 'builds kimchi via bash script' do
      expect(chef_run.bash('build_kimchi')).to do_nothing
    end

    it 'enables runit kimchi service' do
      expect(chef_run).to enable_runit_service('kimchi')
    end
  end

  context 'When all attributes are default, on ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'ubuntu',
        version: '14.04'
      )
      runner.converge(described_recipe)
    end

    it 'installs prequisite packages' do
      expect(chef_run).to install_package('dependencies').with(package_name: %w( gcc make autoconf automake gettext git python-cherrypy3 python-cheetah python-libvirt libvirt-bin python-imaging python-pam python-m2crypto python-jsonschema qemu-kvm libtool python-psutil python-ethtool sosreport python-ipaddr python-ldap python-lxml nfs-common open-iscsi lvm2 xsltproc python-parted nginx python-guestfs libguestfs-tools websockify novnc spice-html5 ))
    end

    it 'syncs a git with attributes' do
      expect(chef_run).to sync_git('/var/chef/cache/kimchi').with(repository: 'git://github.com/kimchi-project/kimchi')
    end

    it 'enables runit kimchi service' do
      expect(chef_run).to enable_runit_service('kimchi')
    end
  end
end
