#
# Cookbook Name:: paramount
# Recipe:: email
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info('[EMAIL]')

# DNS | Records         | Value
# --- | --------------- | -----
# A   | domain.tld      | <IP>
# MX  | domain.tld      | mail.domain.tld
# A   | mail.domain.tld | <IP>

# TODO : helper ruby function
# Resolve MX records for relvant FQDNs, smtp.*, mail.*
# %w(smtp mail imap).each do |domain|
#   ruby_block 'resolve MX records' do
#     block do
#       require 'resolv'
#       Resolv::DNS.new.getresources(node['paramount']['domain'], Resolv::DNS::Resource::IN::MX)
#     end
#     action :run
#   end
# end

include_recipe 'encrypted_attributes'

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

if Chef::EncryptedAttribute.exist?(node['paramount']['encfs_passwd'])
  Chef::EncryptedAttribute.update(node.set['paramount']['encfs_passwd'])
  # encfs_pass = Chef::EncryptedAttribute.load(node['paramount']['encfs_passwd'])
else
  # create the password and save it
  encfs_pass = random_password
  node.set['paramount']['encfs_passwd'] = Chef::EncryptedAttribute.create(encfs_pass)
end

Chef::Log.info("EncFS password: #{encfs_pass}")

directory '/data'

# encfs '/data/encrypted-mail' do
#   password encfs_pass
#   action :mount
# end

user 'vmail' do
  shell '/bin/false'
  supports manage_home: true
  system true
end

group 'vmail' do
  members ['vmail']
  system true
  append true
end

include_recipe 'database::postgresql'

include_recipe 'paramount::_postgrey'
include_recipe 'paramount::_dovecot'
include_recipe 'paramount::_amavis'
include_recipe 'clamav'
include_recipe 'paramount::_spamhaus'
include_recipe 'paramount::_spamassassin'
include_recipe 'paramount::_postfix'
include_recipe 'paramount::_dkim'

include_recipe 'dspam'

include_recipe 'paramount::_roundcube'
# include_recipe 'paramount::_dpush' # requires apache
# include_recipe 'paramount::_automx' # requires php
