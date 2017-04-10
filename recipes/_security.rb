#
# Cookbook Name:: paramount
# Recipe:: _security
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'selinux'
include_recipe 'firewall'
include_recipe 'fail2ban'
include_recipe 'rkhunter'
include_recipe 'openssl'

node.set['aide']['paths'] = {
  '/data/.*' => '!'
}

include_recipe 'aide'

selinux_state "SELinux #{node['selinux']['state'].capitalize}" do
  action node['selinux']['state'].downcase.to_sym
end

directory '/etc/httpd/ssl' do
  owner 'root'
  recursive true
end

openssl_x509 "/etc/httpd/ssl/#{node['paramount']['domain']}.pem" do
  common_name node['paramount']['domain']
  org node['paramount']['organization']
  org_unit node['paramount']['organization_unit']
  country 'US'
end
