#
# Cookbook Name:: paramount
# Recipe:: postfix
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

opendkim_port = node['paramount']['dkim_port']

# Configure Postfix
node.default['postfix']['main']['milter_protocol'] = 2
node.default['postfix']['main']['milter_default_action'] = 'accept'
node.default['postfix']['main']['smtpd_milters'] = "inet:localhost:#{opendkim_port}"
node.default['postfix']['main']['non_smtpd_milters'] = "inet:localhost:#{opendkim_port}"

include_recipe 'encrypted_attributes'

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

if Chef::EncryptedAttribute.exist?(node['paramount']['postgres_passwd'])
  # update with the new keys
  Chef::EncryptedAttribute.update(node.set['paramount']['postgres_passwd'])

  # read the password
  postgres_passwd = Chef::EncryptedAttribute.load(node['paramount']['postgres_passwd'])
else
  # create the password and save it
  postgres_passwd = random_password
  node.default['paramount']['postgres_passwd'] = Chef::EncryptedAttribute.create(postgres_passwd)
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
  password: postgres_passwd
}

postgresql_database_user 'postfix' do
  connection connection_info
  password postgres_passwd
  action :create
end

postgresql_database 'postfix' do
  connection connection_info
  owner 'postfix'
  # login true
  action :create
end

smtp_sasl_passwd = random_password
node.set['postfix']['sasl']['smtp_sasl_passwd'] = smtp_sasl_passwd
Chef::Log.info("SMTP SASL password: #{smtp_sasl_passwd}")

# TODO : postscreen

include_recipe 'postfix::server'

include_recipe 'paramount::_postfixadmin'
include_recipe 'paramount::_dkim'
