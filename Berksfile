# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# source 'https://api.berkshelf.com/'
source 'https://supermarket.chef.io'

metadata

# cookbook 'ark', '~> 0.9.0'
cookbook 'apt', '~> 2.7.0'
cookbook 'chef-client', '~> 4.3.0'
cookbook 'chef-solo-search', '~> 0.5.1'
cookbook 'chef-sugar', '~> 3.1.0'
# cookbook 'cron', '~> 1.6.1'
# cookbook 'database', '~> 4.0.6'
# cookbook 'fail2ban', '~> 2.2.1'
# cookbook 'firewall', '~> 1.1.2'
cookbook 'hostsfile', '~> 2.4.5'
# cookbook 'locales', git: 'git@github.com:redguide/locales.git'
# cookbook 'logstash', '~> 0.11.4'
cookbook 'packages', '~> 0.4.0'
cookbook 'ohai', '~> 2.0.1'
# cookbook 'openssh', '~> 1.4.0'
cookbook 'openssl', '~> 4.0.0'
# cookbook 'os-hardening', '~> 1.2.0'
cookbook 'selinux', '~> 0.9.0'
# cookbook 'ssh-hardening', '~> 1.1.0'
# cookbook 'sudo', '~> 2.7.1'
cookbook 'sysctl', '~> 0.6.2'
cookbook 'ubuntu', '~> 1.1.8'
# cookbook 'rackspace_monitoring', '~ 1.0.0'
# cookbook 'rkhunter', git: 'git@github.com:gregpalmier/rkhunter-cookbook.git'
# cookbook 'rsyslog', '~> 2.0.0'
cookbook 'users', '~> 1.8.2'
# cookbook 'ossec', '~> 1.0.5'
# cookbook 'collectd-lib', '~> 3.0.1'
cookbook 'dovecot', '~> 2.1.0'
# cookbook 'djbdns', '~> 1.1.0'
# cookbook 'logrotate', '~> 1.9.1'
# cookbook 'newrelic', '~> 2.12.0'
cookbook 'nginx', '~> 2.7.6'
# cookbook 'openvpn', '~> 2.1.0'
# cookbook 'owncloud', '~> 0.5.0'
# cookbook 'prosody', '~> 0.5.1'
# cookbook 'roundcube', git: 'git@github.com:TheSerapher/chef-roundcube.git'
cookbook 'ssh_known_hosts', '~> 2.0.0'
# cookbook 'spamassassin', '~> 0.1.2'
# cookbook 'swap', '~> 0.3.8'
# cookbook 'znc', '~> 0.0.1'

group :integration do
  cookbook 'test', path: 'test/fixtures/cookbooks/test'
  cookbook 'apt'
  cookbook 'yum'
end

group :local do
  cookbook 'sovereign', path: File.dirname(__FILE__)
end
