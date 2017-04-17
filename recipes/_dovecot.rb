#
# Cookbook Name:: paramount
# Recipe:: dovecot
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

# logic borrowed from zuazo's postfix-dovecot-cookbook::dovecot
# TODO : install pigeonhole

# 10-ssl.conf
self.class.send(:include, Chef::SslCertificateCookbook::ServiceHelpers)
@ssl_config = ssl_config_for_service('dovecot')

node.default['dovecot']['conf']['ssl'] = true
node.default['dovecot']['conf']['ssl_protocols'] = @ssl_config['protocols']
node.default['dovecot']['conf']['ssl_cipher_list'] = @ssl_config['cipher_suite']
cert = ssl_certificate 'dovecot2' do
  namespace node['paramount']
  notifies :restart, 'service[dovecot]'
end
node.default['dovecot']['conf']['ssl_cert'] = "<#{cert.chain_combined_path}"
node.default['dovecot']['conf']['ssl_key'] = "<#{cert.key_path}"

include_recipe 'dovecot'

# Compile sieve scripts

# this should go after installing dovecot, sievec is required
sieve_global_path = "#{node['dovecot']['conf_path']}/sieve/default.sieve"
execute 'sievec sieve_global_path' do
  command "sievec '#{sieve_global_path}'"
  action :nothing
end

directory File.dirname(sieve_global_path) do
  owner 'root'
  group 'root'
  mode '00755'
  recursive true
  not_if { File.exist? File.dirname(sieve_global_path) }
end

template node['dovecot']['plugins']['sieve']['sieve_global_path'] do
  source 'default.sieve.erb'
  owner 'root'
  group 'root'
  mode '00644'
  only_if { node['paramount']['sieve']['enabled'] }
  notifies :run, 'execute[sievec sieve_global_path]'
end
