#
# Cookbook Name:: kimchi
# Recipe:: _kvm_install
#
# Copyright (c) 2015 Scott Hain, All Rights Reserved.

if rhel?
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
elsif debian?
  package [
    'gcc', 'make', 'autoconf', 'automake', 'gettext', 'git',
    'python-cherrypy3', 'python-cheetah', 'python-libvirt', 'libvirt-bin',
    'python-imaging', 'python-pam', 'python-m2crypto', 'python-jsonschema',
    'qemu-kvm', 'libtool', 'python-psutil', 'python-ethtool', 'sosreport',
    'python-ipaddr', 'python-ldap', 'python-lxml', 'nfs-common',
    'open-iscsi', 'lvm2', 'xsltproc',  'python-parted', 'nginx',
    'python-guestfs', 'libguestfs-tools', 'websockify', 'novnc',
    'spice-html5'   ] do
  action :install
  end
end
