#
# Cookbook Name:: paramount
# Attributes:: rsyslog
#
# Copyright 2018, Michael Burns
# License:: Apache License, Version 2.0
#

# send log lines to localhost only
default['rsyslog']['server_ip'] = '127.0.0.1'
default['rsyslog']['port'] = '5959'
