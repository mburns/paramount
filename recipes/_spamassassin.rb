#
# Cookbook Name:: paramount
# Recipe:: spamassassin
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'paramount::_amavis'

# Required_score is set to 5 by default, change it:
node.default['spamassassin']['conf']['required_score'] = 4
node.default['spamassassin']['spamd']['enabled'] = true
node.default['spamassassin']['spamd']['options'] = %w[
  --create-prefs
  --max-children 3
  --helper-home-dir
]

# local.cf
node.default['spamassassin']['conf']['rewrite_header'] = [
  Subject: '[SPAM]'
]

node.default['spamassassin']['conf']['report_safe'] = false
node.default['spamassassin']['conf']['lock_method'] = 'flock'

include_recipe 'onddo-spamassassin'
