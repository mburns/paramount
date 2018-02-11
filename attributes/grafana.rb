#
# Cookbook Name:: paramount
# Attributes:: grafana
#
# Copyright 2018, Michael Burns
# License:: Apache License, Version 2.0
#

node.default['grafana']['install_type'] = 'package'
# node.default['grafana']['version'] = 'latest'

node.default['grafana']['nginx']['template_cookbook'] = 'paramount'

node.default['grafana']['nginx']['auth_basic'] = false
