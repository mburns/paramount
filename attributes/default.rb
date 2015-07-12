#
# Cookbook Name:: paramount
# Attributes:: default
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['paramount']['domain'] = 'example.com'
default['paramount']['user'] = 'admin'

default['paramount']['contact'] = 'admin@example.com'
# default['paramount']['contact'] = "#{node['paramount']['user']}@#{node['paramount']['domain']}"
