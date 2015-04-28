#
# Cookbook Name:: kimchi
# Recipe:: default
#
# Copyright (c) 2015 Scott Hain, All Rights Reserved.

include_recipe 'runit'
include_recipe 'iptables'

include_recipe 'kimchi::_kvm_install'
include_recipe 'kimchi::_kimchi_install'
