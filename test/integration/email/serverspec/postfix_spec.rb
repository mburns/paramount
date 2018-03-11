# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('sendmail') do
  it { should_not be_installed }
end

describe package('postfix') do
  it { should be_installed }
end

describe package('postfix') do
  it { should be_running }
end
