# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe file('/opt/automx') do
  it { should be_directory }
end
