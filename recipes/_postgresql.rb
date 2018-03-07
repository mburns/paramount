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

postgres_passwd = random_password
node.default['paramount']['postgres_passwd'] = postgres_passwd
Chef::Log.info("Postgres password: #{postgres_passwd}")

postgresql_user node['paramount']['user'] do
  password postgres_passwd
  createdb true
  createrole true
  # valid_until '2038-01-19'
end
postgresql_server_install 'My Postgresql Server install' do
  # password postgres_passwd
  action :install
end

postgresql_server_conf 'PostgreSQL Config' do
  notification :reload
end
