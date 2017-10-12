#
# Cookbook:: consul-ui
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
cookbook_file '/usr/bin/consul' do
source 'consul'
user 'root'
group 'root'
mode '0755'
action :create
end

directory '/etc/config.d' do
  owner 'root'
  group 'root'
  recursive true
  action :create
  mode '0755'
end

cookbook_file '/etc/config.d/config.json' do
source 'config.json'
user 'root'
group 'root'
mode '0755'
action :create
end

execute 'consul_agent' do
command 'consul agent -ui -dir-data=/etc/config.json'
cwd '/root'
end
