#
# Cookbook Name:: apachevirtual
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
directory "/apachevirtual/sites" do
 mode "0755"
 recursive true
end
cookbook_file "/apachevirtual/Dockerfile" do
  source "Dockerfile"
  action :create
end
node["apache"]["sites"].each do |site_name, site_data|
  document_root = "#{site_name}"
 
  template "/apachevirtual/sites/#{site_name}.conf" do
   source "custom.erb"
   mode "0644"
   variables(:document_root => document_root,:port => site_data["port"])
  end
 
  directory "/apachevirtual/sitedoc/#{document_root}" do
   mode "0755"
   recursive true
  end
 
  template "/apachevirtual/sitedoc/#{document_root}/index.html" do
   source "index.html.erb"
   mode "0644"
   variables(:site_name => site_name, :port => site_data["port"])
  end
end
