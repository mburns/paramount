#
# Cookbook Name:: paramount
# Recipe:: grafana
#
# Copyright (C) 2018 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[SYSTEM] :: #{recipe_name}")

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

grafana_passwd = random_password
Chef::Log.info("Postfix password: #{grafana_passwd}")
node.normal['paramount']['postfix_passwd'] = grafana_passwd

include_recipe 'grafana'

grafana_organization node['paramount']['organization']

grafana_user node['paramount']['user'] do
  user(
    name: node['paramount']['name'],
    email: node['paramount']['contact'],
    password: grafana_passwd,
    isAdmin: true
  )
  action :create
end
