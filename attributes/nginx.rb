#
# Cookbook Name:: paramount
# Attributes:: nginx
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

# default['nginx']['install_method'] = 'package'
# default['nginx']['package_name'] = ''
default['nginx']['default_site_enabled'] = false
default['nginx']['repo_source'] = 'distro'
