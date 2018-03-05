# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe service('amavis') do
  it { should be_running }
end
