#
# Cookbook Name:: paramount
# Recipe:: owncloud
#
# Copyright (C) 2015 Michael Burns
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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

include_recipe 'owncloud'
