# encoding: UTF-8

# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

%w[
  plexmediaserver
].each do |f|
  describe service(f) do
    it { should be_running }
  end
end
