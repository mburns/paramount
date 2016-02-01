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

default['paramount']['contact'] = begin
                                    node['paramount']['user'] + '@' + node['paramount']['domain']
                                  rescue
                                    'postmaster@example.com'
                                  end

# prosody
# wallabag
# sabnzbd

default['paramount']['services'] = %w()
