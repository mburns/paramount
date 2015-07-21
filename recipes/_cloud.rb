#
# Cookbook Name:: paramount
# Recipe:: _cloud
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

include_recipe 'paramount::default'

# ssl_certificate 'owncloud-cert' do
#   namespace 'owncloud'
# end

include_recipe 'paramount::prosody'
include_recipe 'owncloud'

# include_recipe 'wallabag'
# include_recipe 'znc'

# include_recipe 'paramount::prosody'
