#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template '/etc/motd' do
   source 'motd.erb'
   owner 'root'
   group 'root'
   mode '0755'
end
