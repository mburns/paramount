#
# Cookbook Name:: paramount
# Attributes:: spamassassin
#
# Copyright 2017, Michael Burns
# License:: Apache License, Version 2.0
#

default['spamassassin']['spamd']['enabled'] = false

# Required_score is set to 5 by default
default['spamassassin']['conf']['required_score'] = 4
default['spamassassin']['conf']['report_safe'] = false
default['spamassassin']['conf']['lock_method'] = 'flock'

# local.cf
default['spamassassin']['conf']['rewrite_header'] = [
  Subject: '[SPAM]',
]

default['spamassassin']['spamd']['options'] = %w(
  --create-prefs
  --max-children 3
  --helper-home-dir
)
