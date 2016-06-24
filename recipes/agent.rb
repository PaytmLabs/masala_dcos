#
# Cookbook Name:: masala_dcos
# Recipe:: agent
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set['dcos']['dcos_role'] = 'slave'
include_recipe 'masala_dcos::default'

