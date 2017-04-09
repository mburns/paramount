#
# Cookbook Name:: paramount
# Recipe:: _email
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

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

Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

if Chef::EncryptedAttribute.exist?(node['paramount']['encfs_passwd'])
  Chef::EncryptedAttribute.update(node.set['paramount']['encfs_passwd'])
  # encfs_pass = Chef::EncryptedAttribute.load(node['paramount']['encfs_passwd'])
else
  # create the password and save it
  encfs_pass = secure_password
  node.set['paramount']['encfs_passwd'] = Chef::EncryptedAttribute.create(encfs_pass)
end

Chef::Log.info("EncFS password: #{encfs_pass}")

directory '/data'

# encfs '/data/encrypted-mail' do
#   password encfs_pass
#   action :mount
# end

package 'postgrey'

include_recipe 'database::postgresql'

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

include_recipe 'paramount::dovecot'
include_recipe 'paramount::amavis'
include_recipe 'paramount::clamav'
include_recipe 'paramount::spamassassin'
include_recipe 'paramount::postfix'
include_recipe 'paramount::dkim'

# include_recipe 'dspam'

include_recipe 'paramount::roundcube' if node.run_list.include?('paramount::_web')
