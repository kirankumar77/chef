#
# Cookbook Name:: nse-monitor
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


node['monitor']['script'].each do |a|

	if a =~ /\.sh/


	template "/usr/bin/#{a}" do 
		source "#{a}.erb"
		user "root"
		group "root"
		mode 0755

		end
	else

	template "/etc/init.d/#{a}" do 
		source "#{a}.erb"
		user "root"
		group "root"
		mode 0755
		end

	end
end