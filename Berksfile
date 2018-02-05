# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://supermarket.chef.io'

metadata

cookbook 'ark', '~> 2.0'
cookbook 'build-essential'
cookbook 'chef-sugar', '~> 3.4'
cookbook 'chef-vault', '~> 2.1'

cookbook 'hostsfile', '~> 2.4'
cookbook 'packages', '~> 1.0'
cookbook 'partial_search'
cookbook 'ohai', '~> 4.2.2'
cookbook 'postgresql', '~> 6.1.1'

## Cloud
cookbook 'djbdns', '~> 3.0'
cookbook 'prosody', '~> 0.5'
# cookbook 'owncloud', github: 'mburns/owncloud-cookbook'
cookbook 'ucspi-tcp'
cookbook 'znc', '~> 0.0.1'

## Email
cookbook 'clamav', github: 'RoboticCheese/clamav-chef'
cookbook 'dovecot', '~> 3.0'
cookbook 'dspam', github: 'mburns/chef-dspam'
cookbook 'opendkim', '~> 2.0'
cookbook 'onddo-spamassassin', '~> 2.0'
cookbook 'postfix', '~> 5.2.1'
# cookbook 'postfixadmin', github: 'mburns/postfixadmin-cookbook', branch: 'mysql2_chef_gem_v2.0'
# cookbook 'roundcube', github: 'mburns/roundcube', branch: 'chef_nginx'
cookbook 'solr_app', '~> 0.0'

## Monitoring & Logs
cookbook 'collectd-lib'
cookbook 'kibana_lwrp', github: 'lusis/chef-kibana'
cookbook 'logrotate', '~> 2.1'
cookbook 'logstash', '~> 0.12.0'
cookbook 'rackspace_monitoring'
cookbook 'rsyslog', '~> 4.0'

## Multimedia
cookbook 'sabnzbd', github: 'multimedia-chef/sabnzbd'
cookbook 'sickbeard', github: 'multimedia-chef/sickbeard'
cookbook 'couchpotato', github: 'multimedia-chef/couchpotato'
cookbook 'plexapp', '~> 1.0.0'

## Web
cookbook 'nginx', '~> 7.0'
cookbook 'php-fpm'

## Security
cookbook 'aide', github: 'mburns/chef-aide', branch: 'remove-duplicates'
cookbook 'automatic_updates', github: 'rackspace-cookbooks/automatic_updates'
# cookbook 'encfs', '~> 0.2.0', github: 'mburns/encfs'
cookbook 'encrypted_attributes', '~> 0.6.0'
cookbook 'fail2ban', '~> 2.3'
cookbook 'firewall', '~> 2.5'
# cookbook 'openvpn', github: 'sous-chefs/openvpn' # pending publication to Supermarket
cookbook 'os-hardening', '~> 1.2'
cookbook 'selinux'
cookbook 'rkhunter', '~> 0.2'
cookbook 'openldap', '~> 3.0'
cookbook 'openssl', '~> 8.1'
cookbook 'ssl_certificate', '~> 2.1'

## System
cookbook 'apt'
cookbook 'chef-client', '~> 6.0'
cookbook 'chef_client_updater', '~> 1.0.2'
cookbook 'docker', '~> 2.9'
cookbook 'hostname', '~> 0.4'
cookbook 'java'
cookbook 'mosh', '~> 0.4.0'
cookbook 'ntp', '~> 3.2'
cookbook 'openssh', '~> 2.1'
cookbook 'poise-service', '~> 1.4'
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
