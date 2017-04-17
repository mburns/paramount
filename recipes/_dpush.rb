#
# Cookbook Name:: paramount
# Recipe:: _dpush
#
# Copyright (C) 2017 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

package 'd-push'
package 'php5-imap'

# php5enmod imap

nginx_site 'd-push' do
  template 'd-push.erb'
  action :enable
  variables(
    base_dir: "#{node['nginx']['log_dir']}/dpush"
  )
end

cookbook_file '/etc/d-push/config.php' do
  source 'd-push.php'
end

# z-push-admin.php z-push-top.php
