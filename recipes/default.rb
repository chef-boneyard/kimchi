#
# Cookbook Name:: kimchi
# Recipe:: default
#
# Copyright (c) 2015 Scott Hain, All Rights Reserved.

include_recipe 'chef-sugar::default'
require 'chef/sugar/core_extensions'

include_recipe 'runit'

include_recipe 'kimchi::_kvm_install'
include_recipe 'kimchi::_kimchi_install'
