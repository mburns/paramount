#
# Cookbook Name:: paramount
# Recipe:: postfixadmin
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'paramount::_postfix'

node.default['postfixadmin']['database']['type'] = 'postgresql'

node.default['postfixadmin']['server_name'] = node['paramount']['hostname']
node.default['postfixadmin']['common_name'] = node['paramount']['hostname']

# include_recipe 'postfixadmin'
# include_recipe 'postfixadmin::map_files'

include_recipe 'encrypted_attributes'

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

if Chef::EncryptedAttribute.exist?(node['paramount']['postfix_passwd'])
  # update with the new keys
  Chef::EncryptedAttribute.update(node.set['paramount']['postfix_passwd'])

  # read the password
  postfix_passwd = Chef::EncryptedAttribute.load(node['paramount']['postfix_passwd'])
else
  # create the password and save it
  postfix_passwd = random_password
  node.set['paramount']['postfix_passwd'] = Chef::EncryptedAttribute.create(postfix_passwd)
end

Chef::Log.info("Postfix password: #{postfix_passwd}")

# postfixadmin_admin node['paramount']['contact'] do
#   password node['postfix']['sasl']['smtp_sasl_passwd']
#   action :create
# end

# postfixadmin_domain node['paramount']['domain'] do
#   login_username node['paramount']['contact']
#   login_password node['postfix']['sasl']['smtp_sasl_passwd']
# end
