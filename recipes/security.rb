#
# Cookbook Name:: paramount
# Recipe:: security
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info('[SECURITY]')

include_recipe 'selinux'
include_recipe 'firewall'
include_recipe 'fail2ban'
include_recipe 'rkhunter'
include_recipe 'openssl'

node.normal['aide']['paths'] = {
  '/data/.*' => '!',
}

include_recipe 'aide'

selinux_state "SELinux #{node['selinux']['state'].capitalize}" do
  action node['selinux']['state'].downcase.to_sym
end
