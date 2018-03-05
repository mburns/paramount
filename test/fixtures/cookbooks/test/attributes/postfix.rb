#
# Cookbook Name:: test
# Attributes:: default
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['postfix'] = {
  main: {
    mydomain: 'unemployable.me',
    message_size_limit: 25_600_000,
    smtp_sasl_auth_enable: true,
    smtp_sender_dependent_authentication: true,
    smtp_sasl_password_maps: 'hash:/etc/postfix/tables/auths', # not managed by chef
    smtp_sasl_security_options: 'noanonymous',
    smtp_sasl_mechanism_filter: '!gssapi, !ntlm, plain, login',
  },
  tables: {
    relayhosts: {
      _type: 'hash',
      _set: 'sender_dependent_relayhost_maps',
      'chef@cookbooks.test' => '[192.0.2.32]',
      '@cookbooks.test' => 'mail37.mails.example',
    },
    aliases: {
      _type: 'hash',
      _set: 'alias_maps',
      _add: 'alias_database',
      _file: '/etc/aliases',
      _cmd: 'postalias',
      'postmaster:' => 'root',
      'root:' => 'sysadmin@unemployable.me',
    },
  },
}
