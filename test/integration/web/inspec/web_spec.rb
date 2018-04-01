# License:: Apache License, Version 2.0
#

require_relative '../../spec_helper'

describe service('nginx') do
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end
