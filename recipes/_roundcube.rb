#
# Cookbook Name:: paramount
# Recipe:: roundcube
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

node.set['roundcube']['version'] = '1.1.2'
# node.set['roundcube']['download_url'] = ''
node.set['roundcube']['download_checksum'] = '237afc9807291efd7c3550c83ca82677a9af72855b6f48733d9e55d6d84fdae1'
node.set['roundcube']['default_host'] = ''
# node.set['roundcube']['support_url'] = ''
node.set['roundcube']['product_name'] = ''
# node.set['roundcube']['listen_port'] = ''
node.set['roundcube']['server_name'] = ''

node.set['roundcube']['database']['user'] = 'roundcube'
node.set['roundcube']['database']['password'] = random_password
# node.set['roundcube']['database']['schema'] = ''

node.set['roundcube']['smtp']['server'] = 'mail.unemployable.me'
# node.set['roundcube']['smtp']['port'] = ''
node.set['roundcube']['smtp']['user'] = 'postfix'
node.set['roundcube']['smtp']['password'] = random_password
