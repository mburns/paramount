#
# Cookbook Name:: paramount
# Recipe:: dovecot
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# logic borrowed from zuazo's postfix-dovecot-cookbook::dovecot
# TODO : install pigeonhole

node.default['dovecot']['conf_files_group'] = 'vmail'

node.default['dovecot']['conf']['disable_plaintext_auth'] = false
node.default['dovecot']['conf_files_mode'] = '00640'

# 10-logging.conf
node.default['dovecot']['conf']['log_path'] = 'syslog'
node.default['dovecot']['conf']['syslog_facility'] = 'mail'
node.default['dovecot']['conf']['log_timestamp'] = '"%Y-%m-%d %H:%M:%S"'

# 10-mail.conf
node.default['dovecot']['conf']['mail_location'] = 'maildir:~/Maildir'
node.default['dovecot']['conf']['mail_privileged_group'] = 'mail'

# 10-master.conf
node.default['dovecot']['services']['auth']['listeners'] = [
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

# 15-lda.conf
node.default['dovecot']['conf']['postmaster_address'] = "postmaster@#{node['paramount']['domain']}"
node.default['dovecot']['conf']['hostname'] = "mail.#{node['paramount']['domain']}"

node.default['dovecot']['conf']['lda_mailbox_autocreate'] = true
node.default['dovecot']['conf']['lda_mailbox_autosubscribe'] = true

node.default['dovecot']['protocols']['lda']['mail_plugins'] = %w[imap sieve]

# 20-imap.conf
# We want IMAP enabled with the default configuration
node.default['dovecot']['protocols']['imap'] = {}

# node.default['dovecot']['protocols']['pop3s'] = {}

# 90-sieve.conf
node.default['dovecot']['plugins']['sieve']['sieve'] = '~/.dovecot.sieve'
node.default['dovecot']['plugins']['sieve']['sieve_dir'] = '~/sieve'
node.default['dovecot']['plugins']['sieve']['sieve_global_path'] =
  "#{node['dovecot']['conf_path']}/sieve/default.sieve"

# auth-sql.conf.ext
node.default['dovecot']['auth']['sql']['passdb']['args'] = '/etc/dovecot/dovecot-sql.conf.ext'
node.default['dovecot']['auth']['sql']['userdb']['args'] = '/etc/dovecot/dovecot-sql.conf.ext'

# auth-static.conf.ext
node.default['dovecot']['auth']['static']['userdb']['args'] = %w[
  uid=vmail
  gid=vmail
  home=/var/vmail/%d/%n
  allow_all_users=yes
]

# auth-system.conf.ext
node.default['dovecot']['auth']['system'] = {}

# dovecot-sql.conf.ext
# We want to enable MySQL driver
node.default['dovecot']['conf']['sql']['driver'] = 'pgsql'

node.default['dovecot']['conf']['sql']['connect'] = %w[
  host=localhost
  dbname=postfix
  user=postfix
  password=#{}
]

# md5crypt encryption method
node.default['dovecot']['conf']['sql']['default_pass_scheme'] = 'MD5-CRYPT'
node.default['dovecot']['conf']['sql']['password_query'] = [
  'SELECT username AS user, password',
  'FROM mailbox',
  "WHERE username = '%u' AND active = '1'"
]

node.default['dovecot']['conf']['sql']['user_query'] = [
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

node.default['dovecot']['conf']['sql']['iterate_query'] = [
  'SELECT username AS user',
  "FROM mailbox WHERE active = '1'"
]

# 10-ssl.conf
self.class.send(:include, Chef::SslCertificateCookbook::ServiceHelpers)
@ssl_config = ssl_config_for_service('dovecot')

node.default['dovecot']['conf']['ssl'] = true
node.default['dovecot']['conf']['ssl_protocols'] = @ssl_config['protocols']
node.default['dovecot']['conf']['ssl_cipher_list'] = @ssl_config['cipher_suite']
cert = ssl_certificate 'dovecot2' do
  namespace node['paramount']
  notifies :restart, 'service[dovecot]'
end
node.default['dovecot']['conf']['ssl_cert'] = "<#{cert.chain_combined_path}"
node.default['dovecot']['conf']['ssl_key'] = "<#{cert.key_path}"

include_recipe 'dovecot'

# Compile sieve scripts

# this should go after installing dovecot, sievec is required
sieve_global_path = "#{node['dovecot']['conf_path']}/sieve/default.sieve"
execute 'sievec sieve_global_path' do
  command "sievec '#{sieve_global_path}'"
  action :nothing
end

directory File.dirname(sieve_global_path) do
  owner 'root'
  group 'root'
  mode '00755'
  recursive true
  not_if { File.exist? File.dirname(sieve_global_path) }
end

template node['dovecot']['plugins']['sieve']['sieve_global_path'] do
  source 'default.sieve.erb'
  owner 'root'
  group 'root'
  mode '00644'
  only_if { node['paramount']['sieve']['enabled'] }
  notifies :run, 'execute[sievec sieve_global_path]'
end
