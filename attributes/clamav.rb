#
# Cookbook Name:: paramount
# Attributes:: opendkim
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['clamav']['clamd']['version'] = 'latest'
default['clamav']['clamd']['enabled'] = false

default['clamav']['freshclam']['enabled'] = false

default['clamav']['scan']['script']['enable'] = true
default['clamav']['scan']['minimal']['enable'] = true
