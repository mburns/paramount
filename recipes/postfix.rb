#
# Cookbook Name:: paramount
# Recipe:: postfix
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

opendkim_port = node['paramount']['dkim_port']

# Configure Postfix
node.default['postfix']['main']['milter_protocol'] = 2
node.default['postfix']['main']['milter_default_action'] = 'accept'
node.default['postfix']['main']['smtpd_milters'] = "inet:localhost:#{opendkim_port}"
node.default['postfix']['main']['non_smtpd_milters'] = "inet:localhost:#{opendkim_port}"

node.default['postgresql']['password']['postgres'] = random_password(length: 50, mode: :base64, encoding: 'ASCII')

package 'sendmail' do
  action :remove
end

user 'postfix' do
  shell '/bin/false'
  supports manage_home: true
  system true
end

group 'postfix' do
  members ['postfix']
  system true
  append true
end

connection_info = {
  host: '127.0.0.1',
  port: '5432',
  username: 'postgres',
  password: node['postgresql']['password']['postgres']
}

postgresql_database_user 'postfix' do
  connection connection_info
  password node['postgresql']['password']['postgres']
  action :create
end

postgresql_database 'postfix' do
  connection connection_info
  owner 'postfix'
  # login true
  action :create
end

node.normal['postfix']['sasl']['smtp_sasl_passwd'] = random_password(length: 50, mode: :base64, encoding: 'ASCII')

include_recipe 'postfix::server'

include_recipe 'paramount::postscreen'
include_recipe 'paramount::postfixadmin'
include_recipe 'paramount::dkim'
