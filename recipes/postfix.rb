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
  password node['paramount']['postfix_passwd']
  action :create
end

postgresql_database 'postfix' do
  connection connection_info
  owner 'postfix'
  # login true
  action :create
end

# TODO : postscreen

# include_recipe 'postfix-full'

node.default['postfixadmin']['database']['type'] = 'postgresql'

include_recipe 'postfixadmin'
include_recipe 'postfixadmin::map_files'

node.default['paramount']['postfix_passwd'] = random_password(length: 50, mode: :base64, encoding: 'ASCII')

postfixadmin_admin node['paramount']['contact'] do
  password node['paramount']['postfix_passwd']
  action :create
end

postfixadmin_domain node['paramount']['domain'] do
  login_username node['paramount']['contact']
  login_password node['paramount']['postfix_passwd']
end

include_recipe 'paramount::dkim'
