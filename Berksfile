# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://supermarket.chef.io'

metadata

cookbook 'ark', '~> 2.0'
cookbook 'build-essential'
cookbook 'chef-sugar', '~> 3.4.0'
cookbook 'chef-vault', '~> 2.1.0'

cookbook 'database', '~> 6.0'
cookbook 'hostsfile', '~> 2.4.5'
cookbook 'packages', '~> 1.0.0'
cookbook 'partial_search'
cookbook 'ohai', '~> 4.2.2'

## Cloud
cookbook 'djbdns', '~> 3.0.0'
cookbook 'prosody', '~> 0.5.2'
# cookbook 'owncloud', git: 'https://github.com/mburns/owncloud-cookbook.git'
cookbook 'ucspi-tcp'
cookbook 'znc', '~> 0.0.1'

## Email
cookbook 'clamav', '~> 1.3.0'
cookbook 'dovecot', '~> 3.0'
cookbook 'dspam', git: 'https://github.com/mburns/chef-dspam.git'
cookbook 'opendkim', '~> 2.0.0'
cookbook 'onddo-spamassassin', '~> 1.1.0'
cookbook 'postfix', '~> 4.0.0'
cookbook 'postfixadmin', '~> 3.0.0'
# cookbook 'roundcube', git: 'https://github.com/mburns/roundcube.git', branch: 'support-pgsql'
cookbook 'solr_app', '~> 0.0.3'

## Monitoring & Logs
cookbook 'collectd-lib'
cookbook 'elkstack', '~> 6.0.4'
cookbook 'kibana_lwrp', '~> 2.0.5'
cookbook 'logrotate', '~> 1.9.2' # clamav requires 1.x
cookbook 'logstash', '~> 0.12.0'
cookbook 'rackspace_monitoring'
cookbook 'rsyslog', '~> 4.0.1'

## Multimedia
cookbook 'sabnzbd', git: 'https://github.com/multimedia-chef/sabnzbd.git'
cookbook 'sickbeard', git: 'https://github.com/multimedia-chef/sickbeard.git'
cookbook 'couchpotato', git: 'https://github.com/multimedia-chef/couchpotato.git'
cookbook 'plexapp', '~> 1.0.0'

## Web
cookbook 'chef_nginx', '~> 5.0'
# cookbook 'php'
cookbook 'php-fpm'

## Security
cookbook 'aide', git: 'https://github.com/mburns/chef-aide.git', branch: 'remove-duplicates'
cookbook 'automatic_updates'
# cookbook 'encfs', '~> 0.2.0', git: 'https://github.com/mburns/encfs.git'
cookbook 'encrypted_attributes', '~> 0.6.0'
cookbook 'fail2ban', '~> 2.3.1'
cookbook 'firewall', '~> 2.5.2'
cookbook 'ldap', '~> 1.1'
# cookbook 'openvpn', git: 'https://github.com/sous-chefs/openvpn.git' # pending publication to Supermarket
cookbook 'os-hardening', '~> 1.2.0'
cookbook 'selinux'
cookbook 'rkhunter', '~> 0.2.5'
cookbook 'openldap', '~> 2.2'
cookbook 'openssl', '~> 6.0.0'
cookbook 'ssl_certificate', '~> 2.1.0'

## System
cookbook 'apt'
cookbook 'chef-client', '~> 6.0.0'
cookbook 'docker', '~> 2.9.7'
cookbook 'hostname', '~> 0.4.0'
cookbook 'java'
cookbook 'mosh', '~> 0.4.0'
cookbook 'ntp', '~> 3.2.0'
cookbook 'omnibus_updater', '~> 2.0.0'
cookbook 'openssh', '~> 2.1.0'
cookbook 'poise-service', '~> 1.4.2'
cookbook 'runit'
cookbook 'sudo', '~> 3.0.0'
cookbook 'sysctl', '~> 0.8.0'
cookbook 'ubuntu', '~> 2.0.0'
cookbook 'users', '~> 4.0.1'
cookbook 'yum'
cookbook 'yum-epel'
cookbook 'xml'

group :integration do
  cookbook 'test', path: 'test/fixtures/cookbooks/test'
end
