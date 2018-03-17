#
# Cookbook Name:: paramount
# Attributes:: kibana
#
# Copyright 2018, Michael Burns
# License:: Apache License, Version 2.0
#

# default['kibana']['port'] = '5601'

normal['kibana']['version'] = 5

default['kibana']['install_method'] = 'package'

default['kibana']['base_dir'] = '/opt/kibana'
