# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

name 'paramount'
maintainer 'Michael Burns'
maintainer_email 'michael@mirwin.net'
license 'Apache 2.0'
description 'Installs/Configures a complete online software stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version '>= 12.9.41' if respond_to?(:chef_version)

version begin
  IO.read(File.join(File.dirname(__FILE__), 'VERSION'))
rescue
  '0.2.0'
end

source_url 'https://github.com/mburns/cookbook-paramount' if respond_to?(:source_url)
issues_url 'https://github.com/mburns/cookbook-paramount/issues' if respond_to?(:issues_url)

supports 'ubuntu', '>= 14.04'

recipe 'paramount::default', 'Includes Security and System configuration'
recipe 'paramount::cloud', 'Various cloud-based tools'
recipe 'paramount::email', 'Builds a full email stack (SMTP, IMAP, POP)'
recipe 'paramount::security', 'Hardens your host system'
recipe 'paramount::system', 'Configures basic system requirements'
recipe 'paramount::web', 'Builds a web host'

depends 'aide'
depends 'automatic_updates'
depends 'apt'
depends 'ark'
depends 'build-essential'
depends 'chef-client'
depends 'chef-sugar'
# depends 'chef-vault'
depends 'clamav'
depends 'couchpotato'
depends 'database'
depends 'djbdns'
depends 'dovecot'
depends 'dspam'
# depends 'encfs'
depends 'elasticsearch'
depends 'elkstack'
depends 'encrypted_attributes'
depends 'fail2ban'
depends 'firewall'
depends 'hostsfile'
depends 'java'
depends 'ldap'
depends 'kibana_lwrp'
depends 'locales'
depends 'mosh'
depends 'chef_nginx'
depends 'ntp'
depends 'ohai'
depends 'opendkim'
depends 'openldap'
depends 'openssh'
depends 'openssl'
# depends 'owncloud'
depends 'packages'
depends 'php-fpm'
depends 'plexapp'
depends 'poise-service'
depends 'postfix'
# depends 'postfixadmin'
depends 'prosody'
depends 'rkhunter'
# depends 'roundcube'
depends 'rsyslog'
depends 'runit'
depends 'sabnzbd'
depends 'sickbeard'
depends 'omnibus_updater'
depends 'onddo-spamassassin'
depends 'selinux'
depends 'ssl_certificate'
depends 'sudo'
# depends 'sysctl'
depends 'ubuntu'
depends 'users'
depends 'yum'
depends 'yum-epel'

attribute 'paramount/domain',
          display_name: 'Domain',
          description: 'Domain Name',
          type: 'string',
          required: 'optional',
          default: 'example.com'

attribute 'paramount/user',
          display_name: 'Username',
          description: 'Default Username',
          type: 'string',
          required: 'optional',
          default: 'admin'

attribute 'paramount/organization',
          display_name: 'Organization',
          description: 'Organization',
          type: 'string',
          required: 'optional',
          default: 'Example'

attribute 'paramount/contact',
          display_name: 'Contact',
          description: 'E-mail contact address',
          type: 'string',
          required: 'optional',
          default: 'postmaster@example.com'
