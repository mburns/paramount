#
# Cookbook Name:: paramount
# Recipe:: _postgrey
#
# Copyright (C) 2017 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

package 'postgrey'

template '/etc/default/postgrey' do
  source 'postgrey'
  notifies :restart, 'service[postgrey]'
end

service 'postgrey' do
  action %i[enable start]
end
