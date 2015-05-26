require 'spec_helper'

describe service('sshd') do
  it { should be_enabled   }
  it { should be_running   }
end

describe 'default' do
  it { skip 'write some tests' }
end
