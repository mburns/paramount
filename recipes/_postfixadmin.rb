#
# Cookbook Name:: paramount
# Recipe:: postfixadmin
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

include_recipe 'paramount::_postfix'

node.default['postfixadmin']['web_server'] = 'nginx'
node.default['postfixadmin']['database']['type'] = 'postgresql'

node.default['postfixadmin']['server_name'] = node['paramount']['hostname']
node.default['postfixadmin']['common_name'] = node['paramount']['hostname']

# include_recipe 'postfixadmin::default'
# include_recipe 'postfixadmin::map_files'

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

postfix_passwd = random_password
node.normal['paramount']['postfix_passwd'] = postfix_passwd
Chef::Log.info("Postfix password: #{postfix_passwd}")

postfixadmin_admin node['paramount']['contact'] do
  password node['postfix']['sasl']['smtp_sasl_passwd']
  action :create
end

postfixadmin_domain node['paramount']['domain'] do
  login_username node['paramount']['contact']
  login_password node['postfix']['sasl']['smtp_sasl_passwd']
end
