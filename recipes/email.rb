#
# Cookbook Name:: paramount
# Recipe:: email
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# include_recipe 'opendkim'
# include_recipe 'spamassassin'
include_recipe 'postfix'
# include_recipe 'postfixadmin'
include_recipe 'dovecot'
include_recipe 'database::postgresql'
# include_recipe 'encfs'

# encfs '/mnt/data' do
#   owner 'root'
#   group 'root'
#   password 'hunter42'
# end

# postgresql_database 'mail_db' do
#   connection(
#     :host      => '127.0.0.1',
#     :port      => 5432,
#     :username  => 'postgres',
#     :password  => node['postgresql']['password']['postgres']
#   )
# end
