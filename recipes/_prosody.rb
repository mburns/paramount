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
  modules_enabled %w[roster saslauth]
  # muc 'conference.redneck.im'
  enabled true
end

include_recipe 'encrypted_attributes'

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

if Chef::EncryptedAttribute.exist?(node['prosody']['password'])
  # update with the new keys
  Chef::EncryptedAttribute.update(node.set['prosody']['password'])

  # read the password
  prosody_passwd = Chef::EncryptedAttribute.load(node['prosody']['password'])
else
  # create the password and save it
  prosody_passwd = random_password
  node.default['prosody']['password'] = Chef::EncryptedAttribute.create(prosody_passwd)
end

Chef::Log.info("Prosody password: #{prosody_passwd}")

prosody_user node['paramount']['user'] do
  password prosody_passwd
  vhosts node['paramount']['domain']
end

prosody_module 'roster' do
  action %i[install enable]
end

prosody_module 'saslauth' do
  action %i[install enable]
end
