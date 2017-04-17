#
# Cookbook Name:: paramount
# Recipe:: wallabag
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[CLOUD] :: #{recipe_name}")

%w[
  curl
  php5-tidy
  php-xml-parser
].each do |pkg|
  package pkg
end

include_recipe 'php-fpm'

version = '1.9'

ark 'wallabag' do
  url "https://github.com/wallabag/wallabag/archive/#{version}.zip"
  path '/var/www/html/wallabag'
  owner 'www-data'
  action :install
end

nginx_site 'wallabag' do
  enable true
end

# TODO : db
