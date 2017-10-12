cookbook_file '/etc/chef/encrypted_data_bag_secret' do
  source 'encrypted_data_bag_secret'
#  user 'root'
#  group 'root'
  mode '0644'
  action :create_if_missing
end
