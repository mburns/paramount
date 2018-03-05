# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe selinux do
  it { should be_permissive }
end

describe service('fail2ban') do
  it { should be_installed }
end

describe service('fail2ban') do
  it { should be_running }
end
