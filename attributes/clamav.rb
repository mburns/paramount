#
# Cookbook Name:: paramount
# Attributes:: opendkim
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['clamav']['clamd']['enabled'] = true
default['clamav']['freshclam']['enabled'] = true
default['clamav']['scan']['script']['enable'] = true
default['clamav']['scan']['minimal']['enable'] = true
