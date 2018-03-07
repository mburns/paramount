# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe service('elasticsearch') do
  it { should be_running }
end

describe package('elasticsearch') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_running }
end

describe file('/etc/nginx/site-enabled/kibana') do
  it { should be_file }
  it { should be_symlink }
end

describe file('/etc/filebeat/conf.d/prospectors_dir_messages.yml') do
  it { should be_file }
end

describe file('/etc/filebeat/conf.d/prospectors_dir_auth_logs.yml') do
  it { should be_file }
end
