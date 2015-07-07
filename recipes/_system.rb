#
# Cookbook Name:: paramount
# Recipe:: system
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# include_recipe 'locales'
include_recipe 'ntp'

automatic_updates 'default' do
  action :enable
end

include_recipe 'build-essential'
include_recipe 'packages'

include_recipe 'sysctl'
include_recipe 'ubuntu'

include_recipe 'sudo'
# include_recipe 'users'

include_recipe 'rsyslog'
# include_recipe 'libyaml'
# include_recipe 'djbdns::cache'
# include_recipe 'xml'

include_recipe 'openssh'

