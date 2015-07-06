# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://supermarket.chef.io'

metadata

cookbook 'ark', '~> 0.9.0'
cookbook 'build-essential'
cookbook 'chef-solo-search', '~> 0.5.1'
cookbook 'chef-sugar', '~> 3.1.0'
cookbook 'chef-vault', '~> 1.3.0'
cookbook 'database', '~> 4.0.6'
cookbook 'postgresql', '~> 3'
cookbook 'hostsfile', '~> 2.4.5'
# cookbook 'locales', git: 'git@github.com:redguide/locales.git'
# cookbook 'nodejs', '~> 2.4.0'
cookbook 'packages', '~> 0.4.0'
cookbook 'partial_search'
cookbook 'ohai', '~> 2.0.1'

## Cloud
cookbook 'djbdns', '~> 1.1.0'
cookbook 'plexapp', '~> 1.0.0'
# cookbook 'prosody', '~> 0.5.1'
# cookbook 'owncloud', '~> 0.5.0'
# cookbook 'znc', '~> 0.0.1'
cookbook 'ucspi-tcp'

## Email
cookbook 'dovecot', '~> 2.1.0'
cookbook 'dspam', git: 'git@github.com:mburns/chef-dspam.git'
cookbook 'opendkim', git: 'git@github.com:mburns/opendkim-cookbook.git'
cookbook 'onddo-spamassassin', '~> 1.0.0'
cookbook 'postfix-full', '~> 0.1.2'
cookbook 'postfixadmin', '~> 2.0.0'
cookbook 'roundcube', git: 'git@github.com:mburns/roundcube.git', branch: 'support-pgsql'
cookbook 'solr_app', '~> 0.0.3'

## Monitoring & Logs
# cookbook 'collectd-lib', '~> 3.0.1'
cookbook 'logrotate', '~> 1.9.1'
# cookbook 'logstash', '~> 0.11.4'
# cookbook 'newrelic', '~> 2.12.0'
# cookbook 'rackspace_monitoring', '~ 1.0.0'
cookbook 'rsyslog', '~> 2.0.0'

## Web
# cookbook 'httpd'
cookbook 'nginx'

## Security
cookbook 'aide', git: 'git@github.com:mburns/chef-aide.git'
cookbook 'encfs', '~> 0.2.0', git: 'git@github.com:mburns/encfs.git'
cookbook 'fail2ban', '~> 2.2.1'
cookbook 'firewall', '~> 1.1.2'
cookbook 'ldap', '~> 1.0'
cookbook 'openvpn', git: 'git@github.com:xhost-cookbooks/openvpn.git'
cookbook 'os-hardening', '~> 1.2.0'
# cookbook 'ossec', '~> 1.0.5'
cookbook 'selinux', '~> 0.9.0'
# cookbook 'ssh-hardening', '~> 1.1.0'
cookbook 'rkhunter', git: 'git@github.com:gregpalmier/rkhunter-cookbook.git'
cookbook 'openldap', '~> 2.1'
cookbook 'openssl', '~> 4.1.1'
cookbook 'ssl_certificate', '~> 1.5.0'

## System
cookbook 'apt', '~> 2.7.0'
# cookbook 'cron', '~> 1.6.1'
# cookbook 'libyaml', '~> 0.1.1'
cookbook 'mosh', '~> 0.4.0'
cookbook 'ntp', '~> 1.8.6'
cookbook 'openssh', '~> 1.4.0'
cookbook 'runit'
# cookbook 'ssh_authorized_keys', '~> 0.2.0'
cookbook 'sudo', '~> 2.7.1'
# cookbook 'swap', '~> 0.3.8'
cookbook 'sysctl', '~> 0.6.2'
cookbook 'ubuntu', '~> 1.1.8'
# cookbook 'users', '~> 1.8.2'
cookbook 'yum'
# cookbook 'yum-ius'
cookbook 'yum-epel'
cookbook 'xml'

group :integration do
  cookbook 'test', path: 'test/fixtures/cookbooks/test'
end

group :local do
  cookbook 'paramount', path: File.dirname(__FILE__)
end
