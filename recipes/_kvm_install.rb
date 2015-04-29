#
# Cookbook Name:: kimchi
# Recipe:: _kvm_install
#
# Copyright (c) 2015 Chef Software, Inc, All Rights Reserved.

package 'dependencies' do
  package_name node['kimchi']['packages']
  action :install
end

service 'libvirtd' do
  action [:enable, :start]
  only_if { node['platform_family'] == 'rhel' }
end
