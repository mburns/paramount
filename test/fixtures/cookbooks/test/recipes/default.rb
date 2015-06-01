#
# Cookbook Name:: test
# Recipe:: default
#
# License:: Apache License, Version 2.0
#

node.set['packages'] = %w(htop iftop iotop iostat lsof netstat tcpdump vmstat)

include_recipe 'paramount::system'
