name 'test'
maintainer 'Michael Burns'
maintainer_email 'michael@mirwin.net'
license 'Apache-2.0'
description 'Installs/Configures test'
version '0.1.0'
source_url 'https://github.com/mburns/cookbook-paramount' if respond_to?(:source_url)
issues_url 'https://github.com/mburns/cookbook-paramount/issues' if respond_to?(:issues_url)
chef_version '>= 12.15.19'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'
supports 'suse'
supports 'opensuse'
supports 'opensuseleap'

depends 'paramount'
