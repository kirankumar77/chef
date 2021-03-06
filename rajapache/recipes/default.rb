#
# Cookbook:: rajapache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

secret = Chef::EncryptedDataBagItem.load("rajnish","us")

log " #{secret['author']}  #{secret['no']}"

node.default['port']=8090

package "httpd" do
	action :install
	not_if "rpm -qa | grep -i httpd" 
end

cookbook_file "/var/www/html/index.html" do
	source "index.html"
	notifies :restart,"service[httpd]",:delayed
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	notifies :restart,"service[httpd]",:delayed
end

service "httpd" do
	action :nothing
end


