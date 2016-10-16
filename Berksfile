# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://supermarket.chef.io'

metadata

cookbook 'ark', '~> 0.9.0'
cookbook 'build-essential'
cookbook 'chef-sugar', '~> 3.1.0'
cookbook 'chef-vault', '~> 2.0.0'

cookbook 'database', '~> 4.0'
cookbook 'hostsfile', '~> 2.4.5'
cookbook 'packages', '~> 0.4.0'
cookbook 'partial_search'
cookbook 'ohai', '~> 4.1'

## Cloud
cookbook 'djbdns', '~> 3.0.0'
cookbook 'prosody', '~> 0.5.2'
# cookbook 'owncloud', git: 'git@github.com:mburns/owncloud-cookbook.git', branch: 'nginx_chef'
cookbook 'ucspi-tcp'
cookbook 'znc', '~> 0.0.1'

## Email
cookbook 'clamav', '~> 1.2.0'
# cookbook 'dovecot', '~> 3.0.0' # requires version 3+
# cookbook 'dspam', git: 'git@github.com:mburns/chef-dspam.git'
cookbook 'opendkim', '~> 1.0.0'
cookbook 'onddo-spamassassin', '~> 1.0.0'
cookbook 'postfix-full', '~> 0.1.2'
# cookbook 'postfixadmin', git: 'git@github.com:mburns/postfixadmin-cookbook.git', branch: 'nginx_chef'
# cookbook 'roundcube', git: 'git@github.com:mburns/roundcube.git', branch: 'support-pgsql'
cookbook 'solr_app', '~> 0.0.3'

## Monitoring & Logs
cookbook 'collectd-lib'
# cookbook 'elasticsearch', '~> 1.0.0' # TODO : elkstack uses 0.3.14 !!
cookbook 'elkstack', '~> 6.0.4'
cookbook 'kibana_lwrp', '~> 2.0.5'
cookbook 'logrotate', '~> 1.9.1'
cookbook 'logstash', '~> 0.11.4'
# cookbook 'newrelic', '~> 2.12.0'
cookbook 'rackspace_monitoring'
cookbook 'rsyslog', '~> 2.0.0'

## Multimedia
# cookbook 'sabnzbd', git: 'git@github.com:multimedia-chef/sabnzbd.git'
# cookbook 'sickbeard', git: 'git@github.com:multimedia-chef/sickbeard.git'
# cookbook 'couchpotato', git: 'git@github.com:multimedia-chef/couchpotato.git'
cookbook 'plexapp', '~> 1.0.0'

## Web
cookbook 'chef_nginx'
# cookbook 'php'
cookbook 'php-fpm'

## Security
# cookbook 'aide', git: 'git@github.com:mburns/chef-aide.git', tag: '0.1.3'
cookbook 'automatic_updates'
# cookbook 'encfs', '~> 0.2.0', git: 'git@github.com:mburns/encfs.git'
cookbook 'encrypted_attributes', '~> 0.6.0'
cookbook 'fail2ban', '~> 2.2.1'
cookbook 'firewall', '~> 2.0.1'
cookbook 'ldap', '~> 1.1'
# cookbook 'openvpn', '~> 3.0' # pending publication to Supermarket
cookbook 'os-hardening', '~> 1.2.0'
cookbook 'selinux'
cookbook 'rkhunter', '~> 0.2.5'
cookbook 'openldap', '~> 2.2'
cookbook 'openssl', '~> 4.1.1'
cookbook 'ssl_certificate', '~> 1.5.0'

## System
cookbook 'apt', '~> 2.7.0'
cookbook 'java'
cookbook 'mosh', '~> 0.4.0'
cookbook 'ntp', '~> 1.8.6'
cookbook 'omnibus_updater', '~> 2.0.0'
cookbook 'openssh', '~> 1.4.0'
cookbook 'poise-service', '~> 1.4.2'
cookbook 'runit'
cookbook 'sudo', '~> 2.7.1'
cookbook 'sysctl', '~> 0.8.0'
cookbook 'ubuntu', '~> 1.1.8'
cookbook 'users', '~> 2.0.2'
cookbook 'yum'
cookbook 'yum-epel'
cookbook 'xml'

group :integration do
  cookbook 'test', path: 'test/fixtures/cookbooks/test'
end
