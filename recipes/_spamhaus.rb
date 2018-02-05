#
# Cookbook Name:: paramount
# Recipe:: _spamhaus
#
# Copyright (C) 2017 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

cookbook_file '/etc/cron.daily/spamhaus' do
  source 'spamhaus.sh'
end
