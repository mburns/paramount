#
# Cookbook Name:: paramount
# Recipe:: web
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[WEB] :: #{recipe_name}")

include_recipe 'chef_nginx'

include_recipe 'paramount::_wallabag'
