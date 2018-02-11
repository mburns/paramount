#
# Cookbook Name:: paramount
# Recipe:: _elk
#
# Copyright (C) 2018 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[SYSTEM] :: #{recipe_name}")

node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['java']['jdk_version'] = 8
node.default['java']['install_flavor'] = 'oracle'
include_recipe 'java'

# elasticsearch
# node.override['elasticsearch']['discovery']['zen']['ping']['multicast']['enabled'] = false
# include_recipe 'elasticsearch::search_discovery' unless Chef::Config[:solo]

# include_recipe 'elasticsearch::data'
# include_recipe 'elasticsearch::default'
# include_recipe 'elasticsearch::plugins'

elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type 'package'
  version node['kibana5']['version']
end

elasticsearch_configure 'elasticsearch'

elasticsearch_service 'elasticsearch'

service 'elasticsearch' do
  supports status: true, restart: true, reload: true
  action [:start]
end

# logstash

# kibana5
include_recipe 'kibana5'

nginx_site 'kibana' do
  template 'nginx-site.conf.erb'
  variables(
    listen_address: '0.0.0.0',
    listen_port: '80',
    server_name: 'kibana.test',
    kibana_port: '5601'
  )
end
# filebeat
