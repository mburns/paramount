#
# Cookbook Name:: paramount
# Recipe:: web
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'nginx'

service 'nginx' do
  action [:enable, :start]
end
