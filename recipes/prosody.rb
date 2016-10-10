#
# Cookbook Name:: paramount
# Recipe:: prosody
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

# include_recipe 'prosody'
# Chef::Resource::ProsodyUser.send(:include, OpenSSLCookbook::RandomPassword)

# prosody_vhost node['paramount']['domain'] do
#   admins [node['paramount']['user']]
#   modules_enabled %w(roster saslauth)
#   # muc 'conference.redneck.im'
#   enabled true
# end

# prosody_user node['paramount']['user'] do
#   password random_password
#   vhosts node['paramount']['domain']
# end

# prosody_module 'roster' do
#   action %i(install enable)
# end

# prosody_module 'saslauth' do
#   action %i(install enable)
# end
