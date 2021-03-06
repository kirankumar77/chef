#
# Cookbook Name:: sapache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.



number=1+4

package 'httpd' do
	action :install
end


cookbook_file "/var/www/html/index.html" do
	source "index.html"
	owner 'root'
	group 'root'
	mode '0755'
	notifies :restart,'service[httpd]',:delayed
end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	variables({
	:name => "praveen",
	:add => number
	})
	notifies :restart,'service[httpd]',:delayed
end


service "httpd" do
	action :start
end

