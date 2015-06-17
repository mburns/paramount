#
# Cookbook Name:: paramount
# Recipe:: dkim
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# Configure OpenDKIM
default['opendkim']['conf']['Mode'] = 'sv'
default['opendkim']['conf']['Socket'] = "inet:#{opendkim_port}@localhost"

main_domain = 'unemployable.me'
selector = '20150615'

# Defines a table that will be queried to convert key names to sets of data of
# the form (signing domain, signing selector, private key). The private key can
# either contain a PEM-formatted private key, a base64-encoded DER format
# private key, or a path to a file containing one of those.
key_table_default = default['opendkim']['conf']['KeyTable']
key_table_default["csl:#{selector}._domainkey.#{main_domain}"] = "#{main_domain}:mail:/etc/opendkim/keys/#{main_domain}/#{selector}.private"

# Defines a dataset that will be queried for the message sender's address
# to determine which private key(s) (if any) should be used to sign the
# message. The sender is determined from the value of the sender
# header fields as described with SenderHeaders above. The key for this
# lookup should be an address or address pattern that matches senders;
# see the opendkim.conf(5) man page for more information. The value
# of the lookup should return the name of a key found in the KeyTable
# that should be used to sign the message. If MultipleSignatures
# is set, all possible lookup keys will be attempted which may result
# in multiple signatures being applied.
default['opendkim']['conf']['SigningTable'] = 'refile:/etc/opendkim/SigningTable'

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
include_recipe 'chef-vault'
key = chef_vault_item('dkim_keys', main_domain)

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

# The txt is optional
file "/etc/opendkim/keys/#{main_domain}/#{selector}.txt" do
  owner node['opendkim']['user']
  group node['opendkim']['group']
  mode '00644'
  content key['txt']
  only_if { key['txt'].is_a?(String) }
end
