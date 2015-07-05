#
# Cookbook Name:: paramount
# Recipe:: postfix
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

opendkim_port = node['paramount']['dkim_port']

# Configure Postfix
node.default['postfix']['main']['milter_protocol'] = 2
node.default['postfix']['main']['milter_default_action'] = 'accept'
node.default['postfix']['main']['smtpd_milters'] = "inet:localhost:#{opendkim_port}"
node.default['postfix']['main']['non_smtpd_milters'] = "inet:localhost:#{opendkim_port}"

node.default['postgresql']['password']['postgres'] = random_password(length: 50, mode: :base64, encoding: 'ASCII')

include_recipe 'postgresql::server'

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

# include_recipe 'postfix-full'

include_recipe 'postfixadmin'

include_recipe 'paramount::dkim'
