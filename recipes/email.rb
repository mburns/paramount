#
# Cookbook Name:: paramount
# Recipe:: email
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

# include_recipe 'encfs'
# encfs '/mnt/data' do
#   owner 'root'
#   group 'root'
#   password random_password
# end

include_recipe 'database::postgresql'

postgresql_connection_info = {
  host: '127.0.0.1',
  port: 5432,
  username: 'postgres',
  password: postfix_passwd
}

postfix_passwd = random_password
postgresql_database_user 'postfix' do
  connection postgresql_connection_info
  password postfix_passwd
  action :create
end

postgresql_database 'postfix_db' do
  connection postgresql_connection_info
end

# Required_score is set to 5 by default, change it:
node.default['spamassassin']['conf']['required_score'] = 4
include_recipe 'onddo-spamassassin'

# roundcube_passwd = random_password
# postgresql_database_user 'roundcube' do
#   connection postgresql_connection_info
#   password roundcube_passwd
#   action :create
# end
#
# postgresql_database 'roundcube_db' do
#   connection postgresql_connection_info
#   action :create
# end

include_recipe 'paramount::_postfix'
include_recipe 'paramount::_dkim'
include_recipe 'paramount::_dovecot'
