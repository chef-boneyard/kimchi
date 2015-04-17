#
# Cookbook Name:: kimchi
# Recipe:: _kvm_install
#
# Copyright (c) 2015 Scott Hain, All Rights Reserved.

package [
  'gcc', 'make', 'autoconf', 'automake', 'gettext-devel', 'git',
  'python-cherrypy', 'python-cheetah', 'libvirt-python', 'libvirt',
  'python-imaging', 'PyPAM', 'm2crypto', 'python-jsonschema', 'rpm-build',
  'qemu-kvm', 'python-psutil', 'python-ethtool', 'sos',
  'python-ipaddr', 'python-ldap', 'python-lxml', 'nfs-utils',
  'iscsi-initiator-utils', 'libxslt', 'pyparted', 'nginx',
  'python-libguestfs', 'libguestfs-tools', 'python-websockify',
  'novnc', 'spice-html5', 'python-unittest2', 'python-ordereddict'
  ] do
action :install
end

service "libvirtd" do
  action :restart
end
