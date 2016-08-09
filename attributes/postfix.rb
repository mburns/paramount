#
# Cookbook Name:: paramount
# Attributes:: postfix
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['postfix']['mail_type'] = 'master'
default['postfix']['main']['mydomain'] = begin
                                          "mail.#{node['paramount']['domain']}"
                                        rescue
                                          'example.com'
                                        end

default['postfix']['main']['inet-interfaces'] = 'all'
default['postfix']['main']['relayhost'] = "[smtp.#{node['postfix']['main']['mydomain']}]"
default['postfix']['main']['smtp_use_tls'] = 'yes'
