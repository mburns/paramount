#
# Cookbook Name:: paramount
# Recipe:: system
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'ntp'

automatic_updates 'default' do
  action :enable
end

include_recipe 'build-essential'
include_recipe 'packages'

# include_recipe 'sysctl'
include_recipe 'ubuntu'

include_recipe 'sudo'

include_recipe 'users::sysadmins'

# TODO: create user from data_bag with users_manage

include_recipe 'rsyslog'

include_recipe 'djbdns::cache'
# include_recipe 'xml'

include_recipe 'openssh'

node.default['elkstack']['config']['backups']['enabled'] = false
# node.default['elasticsearch']['allocated_memory'] = ''
# node.default['elkstack']['config']['lumberjack_data_bag']['key'] = 'SSL CERT'

# node.default['elkstack']['config']['lumberjack_data_bag'] = ''
include_recipe 'elkstack'
