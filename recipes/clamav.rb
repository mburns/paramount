#
# Cookbook Name:: paramount
# Recipe:: clamav
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'paramount::amavis'

node.default['clamav']['clamd']['enabled'] = true
node.default['clamav']['freshclam']['enabled'] = true
node.default['clamav']['scan']['script']['enable'] = true
node.default['clamav']['scan']['minimal']['enable'] = true

include_recipe 'clamav'

# TODO : make more platform-independent
package 'clamav-daemon'

# Add user clamav to amavis group to make them play together!
group 'amavis' do
  members ['clamav']
  append true
end

service 'clamav' do
  service_name 'clamav-daemon'
  supports status: true, restart: true, reload: true
  action %i(enable restart)
end
