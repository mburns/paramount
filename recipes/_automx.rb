#
# Cookbook Name:: paramount
# Recipe:: _automx
#
# Copyright (C) 2017 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

# a2enmod wsgi
# a2enmod rewrite

git '/opt/automx' do
  repository 'https://github.com/sys4/automx.git'
  revision 'master'
  user 'root'
  group 'www-data'
  action :sync
end

# html
# python lib

template '/etc/automx.conf' do
  source 'automx.conf'
  variables(
    domain: node['paramount']['domain'],
    server: node['paramount']['hostname']
  )
end

cookbook_file '/etc/automx.py' do
  source 'automx.py'
end

directory '/var/log/automx' do
  owner 'www-data'
  group 'www-data'
  mode '0700'
  action :create
end

file '/var/log/automx/automx.log' do
  owner 'www-data'
  group 'www-data'
  mode '0644'
  action :create_if_missing
end
