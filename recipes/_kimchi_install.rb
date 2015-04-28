#
# Cookbook Name:: kimchi
# Recipe:: _kimchi_install
#
# Copyright (c) 2015 Scott Hain, All Rights Reserved.

source_path = "#{Chef::Config[:file_cache_path]}/kimchi"

git source_path do
  repository "git://github.com/kimchi-project/kimchi"
  revision node['kimchi']['version']
  action :sync
  notifies :run, 'bash[build_kimchi]', :immediately
end

bash "build_kimchi" do
  cwd source_path
  code <<-EOH
  ./autogen.sh --system
  make
  make install
  EOH
  action :nothing
  notifies :restart, 'runit_service[kimchi]', :delayed
end

iptables_rule 'kimchi'

# script "setup_iptables" do
#   interpreter "bash"
#   user "root"
#   code <<-EOH
#   iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
#   iptables -A INPUT -p tcp --dport 8001 -j ACCEPT
#   iptables -A INPUT -p tcp --dport 64667 -j ACCEPT
#   EOH
#   not_if ('iptables --list-rules | grep 8000')
# end

runit_service 'kimchi'
