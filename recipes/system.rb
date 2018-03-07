#
# Cookbook Name:: paramount
# Recipe:: system
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info('[SYSTEM]')

include_recipe 'ntp'

include_recipe 'apt::unattended-upgrades' if node['platform_family'] == 'debian'
include_recipe 'yum-epel' if platform_family?('rhel')

include_recipe 'build-essential'
include_recipe 'packages'

include_recipe 'ubuntu'

include_recipe 'sudo'

node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['java']['jdk_version'] = 8
node.default['java']['install_flavor'] = 'oracle'
include_recipe 'java'

include_recipe 'users::sysadmins'

# TODO: create user from data_bag with users_manage

include_recipe 'rsyslog'

include_recipe 'collectd::default'

collectd_plugin 'syslog' do
  options do
    log_level 'info'
    notify_level 'OKAY'
  end
end

include_recipe 'djbdns::cache'

include_recipe 'openssh'

include_recipe 'paramount::_elk'
