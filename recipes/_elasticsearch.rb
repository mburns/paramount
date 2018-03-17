#
# Cookbook Name:: paramount
# Recipe:: elasticsearch
#
# Copyright (C) 2018 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[LOGS] :: #{recipe_name}")

include_recipe 'java'

elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type 'tarball'
  version node['kibana']['version']
end

elasticsearch_configure 'elasticsearch' do
  jvm_options %w(
    -XX:+UseParNewGC
    -XX:+UseConcMarkSweepGC
    -XX:CMSInitiatingOccupancyFraction=75
    -XX:+UseCMSInitiatingOccupancyOnly
    -XX:+HeapDumpOnOutOfMemoryError
    -XX:+PrintGCDetails
  )
  action :manage
end

elasticsearch_service 'elasticsearch'

service 'elasticsearch' do
  supports status: true, restart: true, reload: true
  action [:start]
end
