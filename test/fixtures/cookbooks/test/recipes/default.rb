#
# Cookbook Name:: test
# Recipe:: default
#
# License:: Apache License, Version 2.0
#

include_recipe 'test::system'
include_recipe 'test::security'
include_recipe 'test::email'
include_recipe 'test::web'
include_recipe 'test::cloud'
