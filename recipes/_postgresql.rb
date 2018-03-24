#
# Cookbook Name:: paramount
# Recipe:: postgresql
#
# Copyright (C) 2018 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[SYSTEM] :: #{recipe_name}")

if node['platform_family'] == 'debian'
  # Add the contrib package in Ubuntu/Debian
  package 'postgresql-contrib-9.6'
end

# Install adminpack extension
postgresql_extension 'postgres adminpack' do
  database 'postgres'
  extension 'adminpack'
end

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

node.normal['postgresql']['password']['postgres'] = random_password
Chef::Log.info("Postgres password: #{node['postgresql']['password']['postgres']}")

postgresql_user node['paramount']['user'] do
  password node['postgresql']['password']['postgres']
  createdb true
  createrole true
  # valid_until '2038-01-19'
end
postgresql_server_install 'My Postgresql Server install' do
  # password node['postgresql']['password']['postgres']
  action :install
end

postgresql_server_conf 'PostgreSQL Config' do
  notification :reload
end
