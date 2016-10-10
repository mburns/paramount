#
# Cookbook Name:: paramount
# Recipe:: _system
#
# Copyright (C) 2015 Michael Burns
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

include_recipe 'openssh'
