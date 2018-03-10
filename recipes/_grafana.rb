#
# Cookbook Name:: paramount
# Recipe:: grafana
#
# Copyright (C) 2018 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[SYSTEM] :: #{recipe_name}")

include_recipe 'paramount::_graphite'

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

grafana_passwd = random_password
Chef::Log.info("Grafana password: #{grafana_passwd}")
node.normal['paramount']['grafana_passwd'] = grafana_passwd

include_recipe 'grafana'

grafana_organization node['paramount']['organization']

grafana_datasource 'graphite' do
  datasource(
    type: 'graphite',
    url: 'http://localhost:8080',
    access: 'direct'
  )
end

grafana_user node['paramount']['user'] do
  user(
    name: node['paramount']['name'],
    email: node['paramount']['contact'],
    password: grafana_passwd,
    isAdmin: true
  )
  action :create
end

# include_recipe 'grafana::plugins'

# /etc/nginx/htpasswd.users