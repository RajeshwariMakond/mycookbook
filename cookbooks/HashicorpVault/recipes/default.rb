# Cookbook:: HashicorpVault
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file '/usr/bin/vault' do
source 'vault'
user 'root'
group 'root'
mode '0755'
action :create
end

bash 'command' do
  code <<-EOH
    vault server -dev &>/dev/null &
    echo "export VAULT_ADDR='http://127.0.0.1:8200'" >> /etc/environment
    source /etc/environment
   EOH
end
