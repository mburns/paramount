#
# Cookbook Name:: paramount
# Recipe:: owncloud
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[CLOUD] :: #{recipe_name}")

# node.default['owncloud']['admin']['pass'] = ''
# node.default['owncloud']['config']['dbpassword'] = ''
# node.default['owncloud']['database']['rootpassword'] = ''

node.default['owncloud']['server_name'] = node['paramount']['domain']
node.default['owncloud']['config']['dbtype'] = 'pgsql'
# node.default['owncloud']['ssl'] = true

# ssl cert
# node.default['owncloud']['ssl_key']
# node.default['owncloud']['ssl_cert']

# node.default['owncloud']['config']

# include_recipe 'owncloud'
