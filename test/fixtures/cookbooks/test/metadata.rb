name 'test'
maintainer 'Michael Burns'
maintainer_email 'michael@mirwin.net'
license 'Apache-2.0'
description 'Installs/Configures test'
version '0.1.0'
source_url 'https://github.com/mburns/cookbook-paramount' if respond_to?(:source_url)
issues_url 'https://github.com/mburns/cookbook-paramount/issues' if respond_to?(:issues_url)
chef_version '>= 12.9.41'
supports 'ubuntu'

depends 'paramount'
