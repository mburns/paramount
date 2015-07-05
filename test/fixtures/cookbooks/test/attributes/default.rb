#
# Cookbook Name:: test
# Attributes:: default
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

# contact info
default['paramount']['contact'] = 'michael@mirwin.net'
default['paramount']['domain'] = 'unemployable.me'
default['paramount']['user'] = 'mburns'

# web
## owncloud
default['owncloud']['server_name'] = 'roundcube.unemployable.me'
default['owncloud']['admin']['pass'] = 'hunter42'
default['owncloud']['config']['dbpassword'] = 'hunter42'
default['owncloud']['database']['rootpassword'] = 'hunter42'

# email
## postfix
default['postfix']['main']['mydomain'] = 'unemployable.me'

## postfixadmin
default['postfixadmin']['common_name'] = 'postfixadmin.unemployable.me'

## roundcube
default['roundcube']['default_host'] = 'ssl://imap.unemployable.me:993'
default['roundcube']['smtp']['server'] = 'tls://smtp.unemployable.me'
default['roundcube']['smtp']['user'] = ''
default['roundcube']['smtp']['password'] = ''

# database
## postgresql
default['postgresql']['email'] = node['paramount']['contact']

# security
default['rkhunter']['report_email'] = node['paramount']['contact']
