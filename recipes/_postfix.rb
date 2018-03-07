#
# Cookbook Name:: paramount
# Recipe:: postfix
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

smtp_sasl_passwd = random_password
node.default['postfix']['sasl']['smtp_sasl_passwd'] = smtp_sasl_passwd
Chef::Log.info("SMTP SASL password: #{smtp_sasl_passwd}")

package 'sendmail' do
  action :remove
end

# user 'postfix' do
#   shell '/bin/false'
#   manage_home true
#   system true
# end

# group 'postfix' do
#   members ['postfix']
#   system true
#   append true
# end

# TODO : postscreen

node.default['postfix']['master']['cyrus']['active'] = true
node.default['postfix']['master']['maildrop']['active'] = true
node.default['postfix']['sender_canonical_map_entries'] = []

# include_recipe 'postfix'

# include_recipe 'paramount::_postfixadmin'
include_recipe 'paramount::_dkim'
