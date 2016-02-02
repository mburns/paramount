#
# Cookbook Name:: paramount
# Recipe:: _email
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'paramount::default'

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

include_recipe 'openssl::upgrade'
Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)
node.default['paramount']['encfs_passwd'] = random_password(length: 50, mode: :base64, encoding: 'ASCII')

directory '/data/'

# encfs '/data/encrypted-mail' do
#   password node['paramount']['encfs_passwd']
#   action :mount
# end

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

include_recipe 'dspam'

include_recipe 'paramount::roundcube' if node.run_list.include?('paramount::_web')
