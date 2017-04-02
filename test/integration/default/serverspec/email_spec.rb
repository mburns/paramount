# encoding: UTF-8

# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

# dspam
# dovecot
%w(
  amavisd
  postfix
  postgresql
).each do |s|
  describe service(s) do
    it { should be_running }
  end
end
