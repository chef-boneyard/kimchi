#
# Cookbook Name:: kimchi
# Recipe:: _kimchi_install
#
# Copyright (c) 2015 Scott Hain, All Rights Reserved.

source_path = "#{Chef::Config[:file_cache_path]}/kimchi"

git source_path do
  repository "git://github.com/kimchi-project/kimchi"
  action :sync
  notifies :run, 'script[build_kimchi]', :immediately
end

script "build_kimchi" do
  interpreter "bash"
  cwd source_path
  code <<-EOH
  ./autogen.sh --system
  make
  sudo make install
  EOH
  action :nothing
  notifies :enable, 'runit_service[kimchi]', :immediately
end

script "setup_iptables" do
    interpreter "bash"
    user "root"
    code <<-EOH
    iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
    iptables -A INPUT -p tcp --dport 8001 -j ACCEPT
    iptables -A INPUT -p tcp --dport 64667 -j ACCEPT
    EOH
    not_if ('iptables --list-rules | grep 8000')
end

runit_service 'kimchi' do
  action :nothing
end

runit_service 'kimchi' do
  action :start
end
