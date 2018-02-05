#
# Cookbook Name:: paramount
# Recipe:: roundcube
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

# node.default['roundcube']['database']['password'] = random_password
# Chef::Log.info("RoundCube password: #{node['roundcube']['database']['password']}")

# node.default['roundcube']['smtp']['server'] = "mail.#{node['paramount']['domain']}"
# node.default['roundcube']['smtp']['password'] = random_password

# Chef::Log.info("RoundCube SMTP password: #{node['roundcube']['smtp']['password']}")

# postgresql_connection_info = {
#   host: '127.0.0.1',
#   port: 5432,
#   username: 'postgres',
#   password: node['roundcube']['database']['password']
# }
#
# postgresql_database_user 'roundcube_db' do
#   connection postgresql_connection_info
#   password node['roundcube']['database']['password']
#   action :create
# end
#
# postgresql_database 'roundcube_db' do
#   connection postgresql_connection_info
#   action :create
# end

include_recipe 'nginx'

# openssl_x509 '/etc/nginx/ssl/roundcube.pem' do
#   common_name "webmail.#{node['paramount']['domain']}"
#   org node['paramount']['organization']
#   org_unit node['paramount']['organization_unit']
#   country node['paramount']['country']
# end

include_recipe 'php-fpm'

# include_recipe 'roundcube::install'
# include_recipe 'roundcube::configure'

# include_recipe 'roundcube::nginx_vhost'
