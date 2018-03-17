#
# Cookbook Name:: paramount
# Recipe:: logstash
#
# Copyright (C) 2018 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[LOGS] :: #{recipe_name}")

name = 'server'

logstash_instance name do
  action :create
end

logstash_service name do
  action [:enable]
end

logstash_config name do
  action [:create]
  notifies :restart, "logstash_service[#{name}]"
end

# logstash_plugins 'contrib' do
#   instance name
#   name 'logstash-output-influxdb'
#   action [:create]
# end

logstash_pattern name do
  action [:create]
end

logstash_curator 'server' do
  action [:create]
end
