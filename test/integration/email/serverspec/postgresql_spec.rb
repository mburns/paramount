# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('postgresql') do
  it { should be_installed }
end

describe package('postgresql') do
  it { should be_running }
end
