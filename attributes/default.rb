#
# Cookbook Name:: paramount
# Attributes:: default
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['paramount']['domain'] = 'example.com'
default['paramount']['user'] = 'admin'

default['postfix-dovecot']['postmaster_address'] = "postmaster@#{node['paramount']['domain']}"
default['postfix-dovecot']['hostname'] = node['fqdn'] || 'example.local'

default['paramount']['organization'] = 'Example'
default['paramount']['organization_unit'] = 'Paramount'

default['paramount']['contact'] = begin
                                    node['paramount']['user'] + '@' + node['paramount']['domain']
                                  rescue
                                    'postmaster@example.com'
                                  end

default['paramount']['services'] = %w()
