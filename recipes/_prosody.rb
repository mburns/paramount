#
# Cookbook Name:: paramount
# Recipe:: prosody
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[CLOUD] :: #{recipe_name}")

include_recipe 'prosody'

prosody_vhost node['paramount']['domain'] do
  admins [node['paramount']['user']]
  modules_enabled %w(roster saslauth)
  # muc 'conference.redneck.im'
  enabled true
end

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

prosody_passwd = random_password
node.default['prosody']['password'] = prosody_passwd

Chef::Log.info("Prosody password: #{prosody_passwd}")

prosody_user node['paramount']['user'] do
  password prosody_passwd
  vhosts node['paramount']['domain']
end

prosody_module 'roster' do
  action %i(install enable)
end

prosody_module 'saslauth' do
  action %i(install enable)
end
