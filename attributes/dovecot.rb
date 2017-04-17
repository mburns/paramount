#
# Cookbook Name:: paramount
# Attributes:: dovecot
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['dovecot']['auth']['checkpassword'] = {}

default['dovecot']['conf']['disable_plaintext_auth'] = true
default['dovecot']['conf']['hostname'] = node['fqdn'] || 'example.local'
default['dovecot']['conf']['lda_mailbox_autocreate'] = true
default['dovecot']['conf']['lda_mailbox_autosubscribe'] = true
default['dovecot']['conf']['log_path'] = 'syslog'
default['dovecot']['conf']['log_timestamp'] = '"%Y-%m-%d %H:%M:%S"'
default['dovecot']['conf']['mail_location'] = 'maildir:~/Maildir'
default['dovecot']['conf']['mail_privileged_group'] = 'mail'
default['dovecot']['conf']['postmaster_address'] = "postmaster@#{node['paramount']['domain']}"
default['dovecot']['conf']['ssl'] = true
default['dovecot']['conf']['syslog_facility'] = 'mail'

default['dovecot']['conf_files_group'] = 'vmail'
default['dovecot']['conf_files_mode'] = '00640'

default['dovecot']['protocols']['lda']['mail_plugins'] = %w[imap sieve]

# https://github.com/onddo/dovecot-cookbook#namespaces-example
default['dovecot']['namespaces'] = [
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

default['dovecot']['services']['auth']['listeners'] = [
  # auth_socket_path points to this userdb socket by default. It's typically
  # used by dovecot-lda, doveadm, possibly imap process, etc. Its default
  # permissions make it readable only by root, but you may need to relax these
  # permissions. Users that have access to this socket are able to get a list
  # of all usernames and get results of everyone's userdb lookups.
  {
    'unix:auth-userdb' => {
      'mode' => '0600',
      'user' => 'vmail',
      'group' => 'vmail'
    }
  },
  # Postfix smtp-auth
  {
    'unix:/var/spool/postfix/private/auth' => {
      'mode' => '0666',
      'user' => 'postfix',
      'group' => 'postfix'
    }
  }
]

# 20-imap.conf
# We want IMAP enabled with the default configuration
default['dovecot']['protocols']['imap'] = {}

# default['dovecot']['protocols']['pop3s'] = {}

# 90-sieve.conf
default['dovecot']['plugins']['sieve']['sieve'] = '~/.dovecot.sieve'
default['dovecot']['plugins']['sieve']['sieve_dir'] = '~/sieve'
default['dovecot']['plugins']['sieve']['sieve_global_path'] =
  "#{node['dovecot']['conf_path']}/sieve/default.sieve"

# auth-sql.conf.ext
default['dovecot']['auth']['sql']['passdb']['args'] = '/etc/dovecot/dovecot-sql.conf.ext'
default['dovecot']['auth']['sql']['userdb']['args'] = '/etc/dovecot/dovecot-sql.conf.ext'

# auth-static.conf.ext
default['dovecot']['auth']['static']['userdb']['args'] = %w[
  uid=vmail
  gid=vmail
  home=/var/vmail/%d/%n
  allow_all_users=yes
]

# auth-system.conf.ext
default['dovecot']['auth']['system'] = {}

# dovecot-sql.conf.ext
# We want to enable MySQL driver
default['dovecot']['conf']['sql']['driver'] = 'pgsql'

default['dovecot']['conf']['sql']['connect'] = %w[
  host=localhost
  dbname=postfix
  user=postfix
  password=#{}
]

# md5crypt encryption method
default['dovecot']['conf']['sql']['default_pass_scheme'] = 'MD5-CRYPT'
default['dovecot']['conf']['sql']['password_query'] = [
  'SELECT username AS user, password',
  'FROM mailbox',
  "WHERE username = '%u' AND active = '1'"
]

default['dovecot']['conf']['sql']['user_query'] = [
  'SELECT',
  '  username AS user,',
  '  password,',
  '  5000 as uid,',
  '  5000 as gid,',
  "  concat('/var/vmail/', maildir) AS home,",
  "  concat('maildir:/var/vmail/', maildir) AS mail",
  'FROM mailbox',
  "WHERE username = '%u' AND active = '1'"
]

default['dovecot']['conf']['sql']['iterate_query'] = [
  'SELECT username AS user',
  "FROM mailbox WHERE active = '1'"
]
