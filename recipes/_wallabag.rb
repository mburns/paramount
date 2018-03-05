#
# Cookbook Name:: paramount
# Recipe:: wallabag
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[CLOUD] :: #{recipe_name}")

%w(
  curl
  php-tidy
  php-xml-parser
  rsync
  unzip
).each do |pkg|
  package pkg
end

include_recipe 'php-fpm'

ark 'wallabag' do
  url "https://github.com/wallabag/wallabag/archive/#{node['wallabag']['version']}.zip"
  path '/var/www/html/wallabag'
  owner 'www-data'
  action :install
end

composer_project '/var/www/html/wallabag' do
  dev false
  quiet true
  prefer_dist false
  action :install
end

nginx_site 'Enable wallabag' do
  template 'wallabag.erb'
  name 'wallabag'
  action :enable
end
