#
# Cookbook Name:: paramount
# Attributes:: default
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['paramount']['domain'] = 'example.com'
default['paramount']['user'] = 'admin'

default['paramount']['organization'] = 'Example'
default['paramount']['organization_unit'] = 'Paramount'
default['paramount']['country'] = 'US'

default['paramount']['contact'] = begin
                                    node['paramount']['user'] + '@' + node['paramount']['domain']
                                  rescue StandardError
                                    'postmaster@example.com'
                                  end

default['paramount']['services'] = %w[]

default['paramount']['sieve']['enabled'] = true

# TODO: deprecate
default['paramount']['disable_cloud'] = false
default['paramount']['disable_email'] = false
default['paramount']['disable_multimedia'] = false
default['paramount']['disable_web'] = false
