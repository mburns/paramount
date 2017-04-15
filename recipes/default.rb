#
# Cookbook Name:: paramount
# Recipe:: default
#
# Copyright (C) 2015 Michael Burns
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'paramount::security'
include_recipe 'paramount::system'

include_recipe 'paramount::cloud' unless node['paramount']['disable_cloud']
include_recipe 'paramount::email' unless node['paramount']['disable_email']
include_recipe 'paramount::multimedia' unless node['paramount']['disable_multimedia']
include_recipe 'paramount::web' unless node['paramount']['disable_web']
