#
# Cookbook Name:: paramount
# Recipe:: spamassassin
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[EMAIL] :: #{recipe_name}")

include_recipe 'onddo-spamassassin::default'
