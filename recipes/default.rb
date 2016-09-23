#
# Cookbook Name:: masala_dcos
# Recipe:: default
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

include_recipe 'masala_base::default'

# needed this if we need to pre-populate config here
directory '/var/lib/dcos' do
  owner 'root'
  group node['root_group']
  mode 0755
end

# setup http proxy if used
if Chef::Config.has_key?(:http_proxy)

  # TODO: not used yet, will be needed if auth on proxy comes up, and need injection to template
  # mainly here to anchor dependency till we do
  proxy = URI(Chef::Config[:http_proxy])

  # different files for different dcos node types
  fname = (node['dcos']['dcos_role'] == 'master') ? 'environment.proxy' : 'mesos-slave-common'
  template "/var/lib/dcos/#{fname}" do
    source  "proxy-config.erb"
    owner 'root'
    group node['root_group']
    mode  00644
  end
end

include_recipe 'dcos::default'

# If we have cloud-init installed, change dependencies w/ systemd to reflect this
cookbook_file '/etc/systemd/system/dcos.target' do
  source 'dcos.target'
  owner 'root'
  group node['root_group']
  mode '0644'
  action :create
  only_if { ::File.exist? "/etc/cloud/cloud.cfg" }
end

file '/etc/profile.d/dcos.sh' do
  action :delete
  force_unlink true
end

