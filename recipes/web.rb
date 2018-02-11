#
# Cookbook Name:: paramount
# Recipe:: web
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info('[WEB]')

include_recipe 'nginx'
include_recipe 'php-fpm'

directory '/etc/nginx/ssl' do
  owner 'root'
  recursive true
end

openssl_x509 "/etc/nginx/ssl/#{node['paramount']['domain']}.pem" do
  common_name node['paramount']['domain']
  org node['paramount']['organization']
  org_unit node['paramount']['organization_unit']
  country 'US'
end

include_recipe 'paramount::_wallabag'
