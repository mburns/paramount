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

chef_gem 'chef-encrypted-attributes'
require 'chef/encrypted_attributes'

Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

if Chef::EncryptedAttribute.exist?(node['paramount']['password']['postgres'])
  # update with the new keys
  Chef::EncryptedAttribute.update(node.set['paramount']['password']['postgres'])

  # read the password
  postgres_passwd = Chef::EncryptedAttribute.load(node['paramount']['password']['postgres'])
else
  # create the password and save it
  postgres_passwd = secure_password
  node.default['paramount']['password']['postgres'] = Chef::EncryptedAttribute.create(postgres_passwd)
end

Chef::Log.info("Postgres password: #{postgres_passwd}")

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
  password: node['paramount']['password']['postgres']
}

postgresql_database_user 'postfix' do
  connection connection_info
  password node['paramount']['password']['postgres']
  action :create
end

postgresql_database 'postfix' do
  connection connection_info
  owner 'postfix'
  # login true
  action :create
end

if Chef::EncryptedAttribute.exist?(node['postfix']['sasl']['smtp_sasl_passwd'])
  # update with the new keys
  Chef::EncryptedAttribute.update(node.set['postfix']['sasl']['smtp_sasl_passwd'])

  # read the password
  smtp_sasl_passwd = Chef::EncryptedAttribute.load(node['postfix']['sasl']['smtp_sasl_passwd'])
else
  # create the password and save it
  smtp_sasl_passwd = secure_password
  node.set['postfix']['sasl']['smtp_sasl_passwd'] = Chef::EncryptedAttribute.create(postgres_passwd)
end

Chef::Log.info("SMTP SASL password: #{smtp_sasl_passwd}")

# TODO : postscreen

include_recipe 'postfix::server'

include_recipe 'paramount::postfixadmin'
include_recipe 'paramount::dkim'
