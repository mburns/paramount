#
# Cookbook Name:: paramount
# Recipe:: amavis
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

include_recipe 'paramount::_spamassassin'

package 'amavisd-new'

user 'amavis' do
  system true
end

group 'amavis' do
  members ['amavis']
  append true
end

%w[
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
].each do |filename|
  file "/etc/amavis/conf.d/#{filename}" do
    action :delete
    notifies :restart, 'service[amavis]', :delayed
  end
end

template '/etc/amavis/conf.d/01-basic' do
  source 'amavis.erb'
  owner 'root'
  group 'amavis'
  mode 0o644
  notifies :restart, 'service[amavis]', :delayed
end

service 'amavis' do
  action %i[enable start]
end
