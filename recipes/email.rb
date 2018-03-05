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

# Resolve MX records for relvant FQDNs, smtp.*, mail.*
# %w(smtp mail imap).each do |domain|
#   resolve_mx(domain + node['paramount']['domain'])
# end

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

# encfs_pass = random_password
# Chef::Log.info("EncFS password: #{encfs_pass}")

directory '/data'

# encfs '/data/encrypted-mail' do
#   password encfs_pass
#   action :mount
# end

user 'vmail' do
  shell '/bin/false'
  manage_home true
  system true
end

group 'vmail' do
  members ['vmail']
  system true
  append true
end

apt_update 'update apt' if node['platform_family'] == 'debian'

# include_recipe 'postgresql'

include_recipe 'paramount::_postgrey'
include_recipe 'paramount::_dovecot'
include_recipe 'paramount::_amavis'

clamav 'default' do
  version node['clamav']['clamd']['version']
  clamd_config node['clamav']['clamd']['config'] unless node['clamav']['clamd']['config'].nil?
  enable_clamd node['clamav']['clamd']['enabled'] unless node['clamav']['clamd']['enabled'].nil?
  freshclam_config node['clamav']['freshclam']['config'] unless node['clamav']['freshclam']['config'].nil?
  enable_freshclam node['clamav']['freshclam']['enabled'] unless node['clamav']['freshclam']['enabled'].nil?
end

include_recipe 'paramount::_spamhaus'
include_recipe 'paramount::_spamassassin'
include_recipe 'paramount::_postfix'
include_recipe 'paramount::_dkim'

include_recipe 'dspam'

include_recipe 'paramount::_roundcube'
include_recipe 'paramount::_dpush'
include_recipe 'paramount::_automx'
