#
# Cookbook Name:: paramount
# Recipe:: cloud
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

ssl_certificate 'owncloud-cert' do
  namespace 'owncloud'
end

# include_recipe 'owncloud'
# wallabag
# plex
# znc

include_recipe 'paramount::prosody'
