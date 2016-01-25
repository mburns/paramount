#
# Cookbook Name:: paramount
# Attributes:: owncloud
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['owncloud']['server_name'] = 'example.com'
default['owncloud']['ssl'] = true
default['owncloud']['config'] = {}
default['owncloud']['sendfile'] = false
# default['owncloud']['admin']['pass'] = 'hunter42'
# default['owncloud']['config']['dbpassword'] = 'hunter42'
# default['owncloud']['database']['rootpassword'] = 'hunter42'
