# Create a group for running vault binary
group node['REAN-vault']['vault_group'] do
  system true
end

# Create a user for running vault binary
user node['REAN-vault']['vault_user'] do
  group node['REAN-vault']['vault_group']
  home node['REAN-vault']['vault_home']
  shell node['REAN-vault']['vault_shell']
  system true
  manage_home true
end

# Adding correct permissions in case of RHEL variants
directory node['REAN-vault']['vault_home'] do
  mode '0755'
  recursive true
end

directory node['REAN-vault']['vault_config_dir'] do
  owner node['REAN-vault']['vault_user']
  group node['REAN-vault']['vault_group']
  mode '0755'
end

# Download and extract vault
ark 'vault' do
  path node['REAN-vault']['vault_home']
  url node['REAN-vault']['vault_url']
  owner node['REAN-vault']['vault_user']
  group node['REAN-vault']['vault_group']
  action :dump
  backup false
end

# Creating symlink to /usr/local/bin
link '/usr/local/bin/vault' do
  to "#{node['REAN-vault']['vault_home']}/vault"
  link_type :symbolic
end

if node['REAN-vault']['vault_backend'].include? 'file'
  execute 'mlock' do
    command 'setcap cap_ipc_lock=+ep /opt/vault/vault'
    not_if 'getcap /opt/vault/vault | grep +ep > /dev/null 2>&1'
  end

  template "#{node['REAN-vault']['vault_config_dir']}/default.hcl" do
    source 'config_file.hcl.erb'
  end

  # Adding correct init file as per os
  if %w(debian ubuntu).include?(node['platform'])
    template '/etc/init.d/vault' do
      source 'vault_init_debian.erb'
      mode '0755'
    end
  elsif %w(redhat centos amazon fedora).include?(node['platform'])
    template '/etc/init.d/vault' do
      source 'vault_init_rhel.erb'
      mode '0755'
    end
  end

  # Starting and enabling vault service
  service 'vault' do
    action :start
  end
end
