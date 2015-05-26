#
# Cookbook Name:: sovereign
# Attributes:: dovecot
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

# default['dovecot']['conf']['listen'] = best_ip_for(node)
default['dovecot']['conf']['disable_plaintext_auth'] = true
default['dovecot']['conf']['ssl'] = true
