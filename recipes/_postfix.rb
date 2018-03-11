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

# TODO : postscreen

include_recipe 'postfix'

# include_recipe 'paramount::_postfixadmin'
include_recipe 'paramount::_dkim'
