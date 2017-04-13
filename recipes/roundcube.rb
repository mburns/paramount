#
# Cookbook Name:: paramount
# Recipe:: roundcube
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# node.default['roundcube']['default_host'] = ''

# node.default['roundcube']['support_url'] = ''
# node.default['roundcube']['product_name'] = ''
# node.default['roundcube']['listen_port'] = '80'

node.default['roundcube']['database']['host'] = '127.0.0.1'
node.default['roundcube']['database']['user'] = 'roundcube_db'

include_recipe 'encrypted_attributes'

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

if Chef::EncryptedAttribute.exist?(node['roundcube']['database']['password'])
  # update with the new keys
  Chef::EncryptedAttribute.update(node.set['roundcube']['database']['password'])

  # read the password
  roundcube_passwd = Chef::EncryptedAttribute.load(node['roundcube']['database']['password'])
else
  # create the password and save it
  roundcube_passwd = random_password
  node.default['roundcube']['database']['password'] = Chef::EncryptedAttribute.create(roundcube_passwd)
end

Chef::Log.info("RoundCube password: #{roundcube_passwd}")

# node.default['roundcube']['database']['schema'] = ''

node.default['roundcube']['smtp']['server'] = "mail.#{node['paramount']['domain']}"
node.default['roundcube']['smtp']['user'] = 'postfix'

if Chef::EncryptedAttribute.exist?(node['roundcube']['smtp']['password'])
  # update with the new keys
  Chef::EncryptedAttribute.update(node.set['roundcube']['smtp']['password'])

  # read the password
  roundcube_smtp_passwd = Chef::EncryptedAttribute.load(node['roundcube']['smtp']['password'])
else
  # create the password and save it
  roundcube_smtp_passwd = random_password
  node.default['roundcube']['smtp']['password'] = Chef::EncryptedAttribute.create(roundcube_smtp_passwd)
end

Chef::Log.info("RoundCube SMTP password: #{roundcube_smtp_passwd}")

postgresql_connection_info = {
  host: '127.0.0.1',
  port: 5432,
  username: 'postgres',
  password: roundcube_passwd
}

postgresql_database_user 'roundcube_db' do
  connection postgresql_connection_info
  password roundcube_passwd
  action :create
end

postgresql_database 'roundcube_db' do
  connection postgresql_connection_info
  action :create
end

openssl_x509 '/etc/httpd/ssl/roundcube.pem' do
  common_name "webmail.#{node['paramount']['domain']}"
  org node['paramount']['organization']
  org_unit node['paramount']['organization_unit']
  country node['paramount']['country']
end

include_recipe 'php-fpm'
# include_recipe 'chef_nginx'

# include_recipe 'roundcube::install'
# include_recipe 'roundcube::configure'

# php_fpm_pool node['roundcube']['php-fpm']['pool'] do
#   user node['nginx']['user']
#   group node['nginx']['group']
#   listen_owner node['nginx']['user']
#   listen_group node['nginx']['group']
#   listen_mode '0660'
#   # Fix php-fpm cookbook ubuntu support
#   if node['platform'] == 'ubuntu' && node['platform_version'].to_i < 12
#     process_manager 'dynamic'
#   end
# end

# https://raw.githubusercontent.com/xhost-cookbooks/roundcube/master/templates/default/nginx_vhost.erb
# nginx_site node['roundcube']['server_name'] do
#   variables(
#     base_dir: "#{node['roundcube']['install_dir']}/roundcube"
#   )
#   enable true
# end
