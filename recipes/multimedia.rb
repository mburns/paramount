#
# Cookbook Name:: paramount
# Recipe:: multimedia
#
# Copyright (C) 2015 Michael Burns
# License:: Apache License, Version 2.0
#

Chef::Log.info('[MULTIMEDIA]')

node.normal['plexapp']['version'] = '1.5.5.3634-995f1dead'

# node.normal['plexapp']['package_url'] = 'https://downloads.plex.tv/plex-media-server/1.5.5.3634-995f1dead/plexmediaserver_1.5.5.3634-995f1dead_amd64.deb'

# include_recipe 'plexapp'

# include_recipe 'couchpotato'

# include_recipe 'sabnzbd'

# include_recipe 'sickbeard'
