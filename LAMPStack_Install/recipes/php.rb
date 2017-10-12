['php5','php-pear','php5-cgi','php5-dev'].each do |p|
  package p do
    action :install
  end
end

#package "php5" do
#  action :install
#end
#
#package "php-pear" do
#  action :install
#end
#
#package "php5-cgi" do
#  action :install
#end
#
#package "php5-dev" do
#  action :install
#end


cookbook_file "/etc/php5/apache2/php.ini" do
  source "php.ini"
  mode "0644"
  notifies :restart, "service[apache2]"
end

execute "chownlog" do
  command "chown www-data /var/log/php"
  action :nothing
  not_if { ::Dir.exist?('/var/log/php') }
end

directory "/var/log/php" do
  action :create
  notifies :run, "execute[chownlog]"
end

cookbook_file '/var/www/html/info.php' do
source 'info.php'
user 'root'
group 'root'
mode '0755'
action :create
notifies :restart, "service[apache2]"
end
