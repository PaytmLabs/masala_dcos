#
# Cookbook Name:: masala_dcos
# Recipe:: agent
#
# Copyright 2016, Paytm Labs
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

node.set['dcos']['dcos_role'] = 'slave'
include_recipe 'masala_dcos::default'

cookbook_file '/etc/systemd/system/dcos-vol-discovery-priv-agent.service' do
  source 'dcos-vol-discovery-priv-agent.service'
  owner 'root'
  group node['root_group']
  mode '0644'
  action :create
  only_if { ::File.exist? "/etc/cloud/cloud.cfg" }
end

