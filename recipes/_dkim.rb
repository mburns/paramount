#
# Cookbook Name:: paramount
# Recipe:: dkim
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

include_recipe 'paramount::_postfix'

opendkim_port = node['paramount']['dkim_port']
main_domain = node['paramount']['domain']
selector = '20150615' # TODO : explain

node.default['opendkim']['conf']['Socket'] = "inet:#{opendkim_port}@localhost"

key_table_default = node.normal['opendkim']['conf']['KeyTable']
key_table_default["csl:#{selector}._domainkey.#{main_domain}"] = "#{main_domain}:mail:/etc/opendkim/keys/#{main_domain}/#{selector}.private"

node.default['opendkim']['conf']['SigningTable'] = 'refile:/etc/opendkim/SigningTable'

# Install OpenDKIM
include_recipe 'opendkim'

directory '/etc/opendkim' do
  owner 'opendkim'
  group 'opendkim'
  mode '00750'
end

# We create the Signing Table
file '/etc/opendkim/SigningTable' do
  mode '00644'
  content "*@#{main_domain} #{selector}._domainkey.#{main_domain}"
end

cookbook_file '/etc/opendkim/TrustedHosts' do
  source 'TrustedHosts'
  owner 'opendkim'
  group 'opendkim'
  mode '0644'
end

# Read DKIM keys from chef-vault

# node#save avoids chef-vault chicken & egg problem (a bit tricky)
# node.save unless Chef::Config[:solo]

# TODO: - revert hack
# include_recipe 'chef-vault'
# key = chef_vault_item('dkim_keys', main_domain)
key = { 'private' => '0000000000', 'txt' => 'XXXXXXXXXX' }

# Create the credential files

directory "/etc/opendkim/keys/#{main_domain}" do
  owner node['opendkim']['user']
  group node['opendkim']['group']
  recursive true
end

file "/etc/opendkim/keys/#{main_domain}/#{selector}.private" do
  owner node['opendkim']['user']
  group node['opendkim']['group']
  mode '00640'
  content key['private']
end

file "/etc/opendkim/keys/#{main_domain}/#{selector}.txt" do
  owner node['opendkim']['user']
  group node['opendkim']['group']
  mode '00644'
  content key['txt']
  only_if { key['txt'].is_a?(String) }
end
