#
# Cookbook Name:: masala_dcos
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set['dcos']['ip-detect'] = node['system']['primary_interface']
include_recipe 'masala_base::default'
include_recipe 'dcos::default'

