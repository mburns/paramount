#
# Cookbook Name:: paramount
# Attributes:: dovecot
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

# default['dovecot']['conf']['listen'] = best_ip_for(node)
default['dovecot']['conf']['disable_plaintext_auth'] = true
default['dovecot']['conf']['ssl'] = true
default['dovecot']['auth']['checkpassword'] = {}

# https://github.com/onddo/dovecot-cookbook#namespaces-example
node.default['dovecot']['namespaces'] = [
  {
    'separator' => '/',
    'prefix' => '"#mbox/"',
    'location' => 'mbox:~/mail:INBOX=/var/mail/%u',
    'inbox' => true,
    'hidden' => true,
    'list' => false
  }, {
    'separator' => '/',
    'prefix' => '',
    'location' => 'maildir:~/Maildir'
  }, { # this requires Dovecot >= 2.1
    'name' => 'inbox',
    'separator' => '/',
    'prefix' => '',
    'inbox' => true,
    'mailboxes' => {
      'Drafts' => {
        'special_use' => '\Drafts'
      },
      'Junk' => {
        'special_use' => '\Junk'
      },
      'Trash' => {
        'special_use' => '\Trash'
      },
      'Sent' => {
        'special_use' => '\Sent'
      },
      'Sent Messages' => {
        'special_use' => '\Sent'
      },
      'virtual/All' => {
        'special_use' => '\All'
      },
      'virtual/Flagged' => {
        'special_use' => '\All'
      }
    }
  }
]
