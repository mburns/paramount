#
# Cookbook Name:: paramount
# Recipe:: postfixadmin
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

node.default['postfixadmin']['database']['type'] = 'postgresql'

node.default['postfixadmin']['server_name'] = node['paramount']['hostname']
node.default['postfixadmin']['common_name'] = node['paramount']['hostname']

# include_recipe 'postfixadmin'
# include_recipe 'postfixadmin::map_files'

node.default['paramount']['postfix_passwd'] = random_password(length: 50, mode: :base64, encoding: 'ASCII')

# postfixadmin_admin node['paramount']['contact'] do
#   password node['paramount']['postfix_passwd']
#   action :create
# end

# postfixadmin_domain node['paramount']['domain'] do
#   login_username node['paramount']['contact']
#   login_password node['paramount']['postfix_passwd']
# end
