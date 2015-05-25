name 'sovereign'
maintainer 'Michael Burns'
maintainer_email 'michael@mirwin.net'
license 'Apache 2.0'
description 'Installs/Configures a Sovereign software stack'
long_description 'Build a personal cloud of services for your digital presence'
version '0.1.0'

depends 'chef-sugar'
depends 'ark'
depends 'hostsfile'
depends 'build-essential'

depends 'ubuntu'
depends 'apt'
depends 'sysctl'
depends 'locales'
depends 'packages'
depends 'users'

depends 'fail2ban'
depends 'sudo'
depends 'rsyslog'
depends 'firewall'
depends 'logstash'
#depends 'selinux'
#depends 'rkhunter'
#depends 'os-hardening'
#depends 'ssh-hardening'

depends 'chef-client'
depends 'openssh'
depends 'database'

depends 'rackspace_monitoring'

#depends 'dovecot'
#depends 'spamassassin'

#depends 'nginx'
#depends 'roundcube'
#depends 'owncloud'
