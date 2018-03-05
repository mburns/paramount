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
  # 'nginx-request-limit' => {
  #   "enabled" => "true",
  #   "port" => "http",
  #   'failregex' => ["limiting requests, excess:.* by zone.*client: <HOST>"],
  #   "ignoreregex" => []
  # },
  'smtp' => {
    'enabled' => 'true',
    'port' => 'smtp',
    'filter' => 'smtp',
    'logpath' => node['fail2ban']['auth_log'],
    'maxretry' => '6',
  },
}
