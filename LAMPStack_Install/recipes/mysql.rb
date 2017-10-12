#Install Mysql


#mysql_service 'foo' do
#  port '3306'
#  version '5.5'
#  initial_root_password '8h+iHUtaoW50BnpRpYt3Zg=='
#  action [:create, :start]
#end

#include_recipe 'LAMPStack_Install::databagk'
#mysql = data_bag_item('mysql', 'rtpass') 
#mysql['password']

#=====================================================================
#without external dependency 

#mysqlpass = data_bag_item("mysql", "rtpass.json")
#
#execute "set_password" do
# command "debconf-set-selections <<< \"mysql-server mysql-server/root_password password #{mysqlpass['password']}\""
#end
#
#execute "set_password_again" do
# command "debconf-set-selections <<< \"mysql-server mysql-server/root_password_again password #{mysqlpass['password']}\""
#end
#
#package 'mysql-server'
#
#=======================================================================
#with exeternal dependency

mysqlpass = data_bag_item("mysql", "rtpass.json")

mysql_service "mysqldefault" do
  initial_root_password mysqlpass["password"]
  action [:create, :start]
end
