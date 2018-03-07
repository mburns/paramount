#
# Cookbook Name:: paramount
# Attributes:: postgresql
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['postgresql']['email'] = 'admin@example.com'
default['postgresql']['config']['listen_addresses'] = 'localhost'

default['postgresql']['config']['logging_collector'] = true
default['postgresql']['config']['datestyle'] = 'iso, mdy'
default['postgresql']['config']['ident_file'] = nil
