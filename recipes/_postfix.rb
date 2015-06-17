#
# Cookbook Name:: paramount
# Recipe:: email
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# Configure Postfix
opendkim_port = 8891
node.default['postfix']['main']['milter_protocol'] = 2
node.default['postfix']['main']['milter_default_action'] = 'accept'
node.default['postfix']['main']['smtpd_milters'] = "inet:localhost:#{opendkim_port}"
node.default['postfix']['main']['non_smtpd_milters'] = "inet:localhost:#{opendkim_port}"

include_recipe 'postfix-full'
include_recipe 'postfixadmin'
