#
# Cookbook Name:: paramount
# Attributes:: omnibus
#
# Copyright 2016, Michael Burns
# License:: Apache License, Version 2.0
#

# default['omnibus_updater']['version'] = '12.8.1'

default['omnibus_updater']['prevent_downgrade'] = true
default['omnibus_updater']['kill_chef_on_upgrade'] = false
