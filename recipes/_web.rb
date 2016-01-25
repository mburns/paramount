#
# Cookbook Name:: paramount
# Recipe:: _web
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'paramount::default'

include_recipe 'nginx'

service 'nginx' do
  action %i(enable start)
end

openssl_x509 "/etc/httpd/ssl/#{node['paramount']['domain']}.pem" do
  common_name node['paramount']['domain']
  org node['paramount']['organization']
  org_unit node['paramount']['organization_unit']
  country 'US'
end

include_recipe 'paramount::wallabag'
