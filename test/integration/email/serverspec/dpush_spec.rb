# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe package('d-push') do
  it { should be_installed }
end

describe package('php5-imap') do
  it { should be_installed }
end
