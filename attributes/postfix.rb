#
# Cookbook Name:: paramount
# Attributes:: postfix
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

include_attribute 'paramount::default'
include_attribute 'paramount::dkim'

default['postfix']['mail_type'] = 'master'

domain = begin
  "mail.#{node['paramount']['domain']}"
rescue StandardError
  'example.com'
end

include_attribute 'postfix::default'

default['postfix']['main']['inet_interfaces'] = 'all'
default['postfix']['main']['milter_protocol'] = 2
default['postfix']['main']['milter_default_action'] = 'accept'
default['postfix']['main']['mydomain'] = domain
default['postfix']['main']['myorigin'] = domain
default['postfix']['main']['non_smtpd_milters'] = "inet:localhost:#{node['paramount']['dkim_port']}"
default['postfix']['main']['relayhost'] = "[smtp.#{node['postfix']['main']['mydomain']}]"
default['postfix']['main']['smtpd_milters'] = "inet:localhost:#{node['paramount']['dkim_port']}"
default['postfix']['main']['smtp_sasl_auth_enable'] = 'yes'
default['postfix']['main']['smtp_sasl_security_options'] = 'keep'

# default['postfix']['master']['cyrus']['active'] = true
default['postfix']['master']['maildrop']['active'] = false

default['postfix']['sasl']['smtp_sasl_user_name'] = node['paramount']['user']

default['postfix']['sender_canonical_map_entries'] = {}
