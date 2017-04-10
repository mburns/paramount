#
# Cookbook Name:: paramount
# Recipe:: dkim
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

opendkim_port = node['paramount']['dkim_port']
main_domain = node['paramount']['domain']
selector = '20150615' # TODO : explain

node.default['opendkim']['conf']['MinimumKeyBits'] = '1024'
node.default['opendkim']['conf']['Mode'] = 'sv'
node.default['opendkim']['conf']['OversignHeaders'] = 'From'
node.default['opendkim']['conf']['Socket'] = "inet:#{opendkim_port}@localhost"
node.default['opendkim']['conf']['Syslog'] = true
node.default['opendkim']['conf']['SyslogSuccess'] = true
node.default['opendkim']['conf']['UMask'] = '002'

key_table_default = node.set['opendkim']['conf']['KeyTable']
key_table_default["csl:#{selector}._domainkey.#{main_domain}"] = "#{main_domain}:mail:/etc/opendkim/keys/#{main_domain}/#{selector}.private"

node.default['opendkim']['conf']['SigningTable'] = 'refile:/etc/opendkim/SigningTable'

# We create the Signing Table

directory '/etc/opendkim' do
  mode '00755'
end

file '/etc/opendkim/SigningTable' do
  mode '00644'
  content "*@#{main_domain} #{selector}._domainkey.#{main_domain}"
end

# Install OpenDKIM

include_recipe 'opendkim'

# Read DKIM keys from chef-vault

# node#save avoids chef-vault chicken & egg problem (a bit tricky)
node.save unless Chef::Config[:solo]

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
