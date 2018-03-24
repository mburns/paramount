#
# Cookbook Name:: paramount
# Recipe:: ldap
#
# Copyright (C) 2016 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info("[PARAMOUNT] :: #{recipe_name}")

include_recipe 'openldap'

# Use https://github.com/atomic-penguin/cookbook-certificate cookbook for advanced certificate deployment
# or use wrapper cookbook to source ssl files from the wrapper cookbook folder structure:
# r = resources("cookbook_file[#{node['openldap']['ssl_cert']}]")
# r.cookbook('paramount')
#
# r = resources("cookbook_file[#{node['openldap']['ssl_key']}]")
# r.cookbook('paramount')
