#
# Cookbook Name:: paramount
# Recipe:: cloud
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

# ssl_certificate 'owncloud-cert' do
#   namespace 'owncloud'
# end

include_recipe 'paramount::_prosody'

# include_recipe 'owncloud'

# include_recipe 'wallabag'

# include_recipe 'znc'
