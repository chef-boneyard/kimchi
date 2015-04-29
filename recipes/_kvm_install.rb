#
# Cookbook Name:: kimchi
# Recipe:: _kvm_install
#
# Copyright (c) 2015 Scott Hain, All Rights Reserved.

package node['kimchi']['packages'] do
  action :install
end

service 'libvirtd' do
  action [:enable, :start]
  only_if { node['platform_family'] == 'rhel' }
end
