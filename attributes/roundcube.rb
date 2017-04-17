#
# Cookbook Name:: paramount
# Attributes:: roundcube
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['roundcube']['server_name'] = 'example.com'

# default['roundcube']['default_host'] = ''

# default['roundcube']['support_url'] = ''
# default['roundcube']['product_name'] = ''
# default['roundcube']['listen_port'] = '80'

default['roundcube']['database']['host'] = '127.0.0.1'
default['roundcube']['database']['user'] = 'roundcube_db'

default['roundcube']['smtp']['user'] = 'postfix'

# default['roundcube']['database']['schema'] = ''
