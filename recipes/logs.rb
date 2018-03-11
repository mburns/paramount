#
# Cookbook Name:: paramount
# Recipe:: logs
#
# Copyright (C) 2018 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info('[LOGS]')

include_recipe 'paramount::_elasticsearch'

# logstash

# kibana5
include_recipe 'kibana5'

nginx_site 'kibana' do
  template 'nginx-kibana.conf.erb'
  variables(
    listen_address: '0.0.0.0',
    listen_port: '80',
    server_name: node['hostname'],
    kibana_port: node['kibana5']['config']['server.port']
  )
end

# filebeat
include_recipe 'filebeat::default'

filebeat_prospector 'messages' do
  paths ['/var/log/messages']
  document_type 'apache'
  ignore_older '24h'
  scan_frequency '15s'
  harvester_buffer_size 16384
  fields 'type' => 'apacheLogs'
end

filebeat_prospector 'auth_logs' do
  paths ['/var/log/auth.log']
  document_type 'auth'
  harvester_buffer_size 16_384
end