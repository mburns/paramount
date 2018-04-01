#
# Cookbook Name:: paramount
# Attributes:: fail2ban
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['fail2ban']['email'] = node['paramount']['contact']

default['fail2ban']['services'] = {
  'ssh' => {
    'enabled' => 'true',
    'port' => 'ssh',
    'filter' => 'sshd',
    'logpath' => node['fail2ban']['auth_log'],
    'maxretry' => '6',
  },
}
