#
# Cookbook Name:: paramount
# Attributes:: opendkim
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['paramount']['dkim_port'] = 8891

default['opendkim']['conf']['MinimumKeyBits'] = '1024'
default['opendkim']['conf']['Mode'] = 'sv'
default['opendkim']['conf']['OversignHeaders'] = 'From'
default['opendkim']['conf']['Syslog'] = true
default['opendkim']['conf']['SyslogSuccess'] = true
default['opendkim']['conf']['UMask'] = '002'
