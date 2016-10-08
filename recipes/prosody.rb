#
# Cookbook Name:: paramount
# Recipe:: prosody
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

# include_recipe 'prosody'
# Chef::Resource::ProsodyUser.send(:include, OpenSSLCookbook::RandomPassword)

# prosody_vhost node['paramount']['domain'] do
#   admins [node['paramount']['user']]
#   modules_enabled %w(roster saslauth)
#   # muc 'conference.redneck.im'
#   enabled true
# end

# prosody_user node['paramount']['user'] do
#   password random_password
#   vhosts node['paramount']['domain']
# end

# prosody_module 'roster' do
#   action %i(install enable)
# end

# prosody_module 'saslauth' do
#   action %i(install enable)
# end
