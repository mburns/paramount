#
# Cookbook Name:: paramount
# Recipe:: amavis
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

# TODO : make more platform-independent
package 'amavisd-new'

user 'amavis' do
  system true
end

group 'amavis' do
  members ['amavis']
  append true
end

%w(
  01-debian
  05-domain_id
  05-node_id
  15-av_scanners
  15-content_filter_mode
  20-debian_defaults
  21-ubuntu_defaults
  25-amavis_helpers
  30-template_localization
  40-policy_banks
  50-user
).each do |filename|
  file "/etc/amavis/conf.d/#{filename}" do
    action :delete
    notifies :restart, 'poise_service[amavis]', :delayed
  end
end

template '/etc/amavis/conf.d/01-basic' do
  source 'amavis.erb'
  owner 'amavis'
  group 'amavis'
  mode 0644
  notifies :restart, 'poise_service[amavis]', :delayed
end

# TODO : setup `amavis service
# poise_service 'amavis' do
#   command 'amavisd'
#   supports [:restart]
#   action [:enable, :start]
# end
