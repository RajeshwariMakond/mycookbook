#
# Cookbook:: LAMStack_Install
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#execute "update-upgrade" do
#  command "apt-get update && apt-get upgrade -y"
#  action :run
#end

apt_update 'upgrade' do
  action :periodic
end

include_recipe 'LAMPStack_Install::apache'
include_recipe 'LAMPStack_Install::mysql'
include_recipe 'LAMPStack_Install::php'
