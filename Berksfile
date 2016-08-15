# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://supermarket.chef.io'

metadata

cookbook 'ark', '~> 0.9.0'
cookbook 'build-essential'
cookbook 'chef-sugar', '~> 3.1.0'
cookbook 'chef-vault', git: 'git@github.com:chef-cookbooks/chef-vault.git', tag: 'v1.3.2'

cookbook 'database', '~> 4.0'
cookbook 'hostsfile', '~> 2.4.5'
cookbook 'packages', '~> 0.4.0'
cookbook 'partial_search'
cookbook 'ohai', '~> 2.0.1'

## Cloud
cookbook 'djbdns', '~> 1.1.0'
cookbook 'prosody', git: 'git@github.com:mburns/chef-prosody.git'
cookbook 'owncloud', git: 'git@github.com:onddo/owncloud-cookbook.git'
cookbook 'ucspi-tcp'
# cookbook 'znc', '~> 0.0.1'

## Email
cookbook 'clamav', '~> 1.2.0'
cookbook 'dovecot', '~> 2.1.0'
cookbook 'dspam', git: 'git@github.com:mburns/chef-dspam.git'
cookbook 'opendkim', '~> 1.0.0'
cookbook 'onddo-spamassassin', '~> 1.0.0'
cookbook 'postfix-full', '~> 0.1.2'
cookbook 'postfixadmin', git: 'git@github.com:onddo/postfixadmin-cookbook.git'
cookbook 'roundcube', git: 'git@github.com:mburns/roundcube.git', branch: 'support-pgsql'
cookbook 'solr_app', '~> 0.0.3'

## Monitoring & Logs
cookbook 'logrotate', '~> 1.9.1'
cookbook 'rsyslog', '~> 2.0.0'

## Multimedia
cookbook 'sabnzbd', git: 'git@github.com:multimedia-chef/sabnzbd.git'
cookbook 'sickbeard', git: 'git@github.com:multimedia-chef/sickbeard.git'
cookbook 'couchpotato', git: 'git@github.com:multimedia-chef/couchpotato.git'
cookbook 'plexapp', '~> 1.0.0'

## Web
cookbook 'nginx'
# cookbook 'php'
cookbook 'php-fpm'

## Security
cookbook 'aide', git: 'git@github.com:mburns/chef-aide.git'
cookbook 'automatic_updates'
cookbook 'encfs', '~> 0.2.0', git: 'git@github.com:mburns/encfs.git'
cookbook 'fail2ban', '~> 2.2.1'
cookbook 'firewall', '~> 1.1.2'
cookbook 'ldap', '~> 1.0'
cookbook 'openvpn', git: 'git@github.com:xhost-cookbooks/openvpn.git'
cookbook 'os-hardening', '~> 1.2.0'
cookbook 'selinux', '~> 0.9.0'
cookbook 'rkhunter', git: 'git@github.com:gregpalmier/rkhunter-cookbook.git'
cookbook 'openldap', '~> 2.1'
cookbook 'openssl', '~> 4.1.1'
cookbook 'ssl_certificate', '~> 1.5.0'

## System
cookbook 'apt', '~> 2.7.0'
cookbook 'java'
cookbook 'mosh', '~> 0.4.0'
cookbook 'ntp', '~> 1.8.6'
cookbook 'openssh', '~> 1.4.0'
cookbook 'runit'
cookbook 'sudo', '~> 2.7.1'
cookbook 'sysctl', '~> 0.6.2'
cookbook 'ubuntu', '~> 1.1.8'
cookbook 'users', '~> 2.0.2'
cookbook 'yum'
cookbook 'yum-epel'
cookbook 'xml'

group :integration do
  cookbook 'test', path: 'test/fixtures/cookbooks/test'
end

group :local do
  cookbook 'paramount', path: File.dirname(__FILE__)
end
