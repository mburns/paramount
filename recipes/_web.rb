#
# Cookbook Name:: paramount
# Recipe:: _web
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'nginx'

service 'nginx' do
  action %i(enable start)
end

openssl_x509 '/etc/httpd/ssl/unemployable.me.pem' do
  common_name 'unemployable.me'
  org 'Miriwn'
  org_unit 'Unemployable'
  country 'US'
end

# instapaper/pocket clone
include_recipe 'paramount::wallabag'
