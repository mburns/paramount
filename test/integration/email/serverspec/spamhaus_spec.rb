# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe file('/etc/cron.daily/spamhaus') do
  it { should be_file }
end
