#
# Cookbook Name:: paramount
# Attributes:: postfix
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['postfix']['mail_type'] = 'master'
default['postfix']['main']['mydomain'] = 'example.com'
default['postfix']['main']['inet-interfaces'] = 'all'
# default['postfix']['main']['relayhost'] = '[smtp.example.com]'
default['postfix']['main']['smtp_use_tls'] = 'yes'
