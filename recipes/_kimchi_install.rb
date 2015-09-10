#
# Cookbook Name:: kimchi
# Recipe:: _kimchi_install
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

source_path = "#{Chef::Config[:file_cache_path]}/kimchi"

git source_path do
  repository 'git://github.com/kimchi-project/kimchi'
  revision node['kimchi']['version']
  action :sync
  notifies :run, 'bash[build_kimchi]', :immediately
end

bash 'build_kimchi' do
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

runit_service 'kimchi'
