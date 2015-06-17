#
# Cookbook Name:: paramount
# Recipe:: security
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# include_recipe 'selinux'
# include_recipe 'os-hardening'
include_recipe 'aide'
include_recipe 'firewall'
include_recipe 'fail2ban'
include_recipe 'rkhunter'
include_recipe 'openssl'

node.set['aide']['paths'] = {
  '/data/.*' => '!'
}

# selinux_state "SELinux #{node['selinux']['state'].capitalize}" do
#   action node['selinux']['state'].downcase.to_sym
# end

openssl_x509 '/etc/httpd/ssl/unemployable.pem' do
  common_name 'unemployable.me'
  org 'Mirwin'
  org_unit 'Unemployable'
  country 'US'
end
