#
# Cookbook:: HashicorpConsul
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

execute 'cookbook command' do
 command 'consul agent -data-dir=/consul/data -datacenter=sa-ia-config-dc -log-level=info -client=0.0.0.0 -server=true -bootstrap=true -ui -node=consul-server-node &>/dev/null &'
 action :run
 not_if { ::Dir.exist?('/consul/data') }
end
