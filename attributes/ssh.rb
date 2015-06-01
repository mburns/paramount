#
# Cookbook Name:: paramount
# Attributes:: ssh
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['openssh']['client']['ForwardX11'] = 'no'
default['openssh']['client']['protocol'] = '2'
default['openssh']['client']['batchmode'] = 'no'
default['openssh']['client']['CheckHostIP'] = 'yes'
default['openssh']['client']['HostbasedAuthentication'] = 'no'
default['openssh']['client']['RhostsRSAAuthentication'] = 'no'
default['openssh']['client']['compression'] = 'yes'

default['openssh']['server']['PermitRootLogin'] = 'no'
default['openssh']['server']['protocol'] = '2'
default['openssh']['server']['StrictModes'] = 'yes'
default['openssh']['server']['PermitEmptyPasswords'] = 'no'
default['openssh']['server']['TCPKeepAlive'] = 'no'
default['openssh']['server']['X11Forwarding'] = 'no'
