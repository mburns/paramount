# encoding: UTF-8

# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

%w[
  amavisd
  dspam
  dovecot
].each do |s|
  describe service(s) do
    it { should be_running }
  end
end

# smtp
# describe port(25) do
#   it { should be_listening }
# end

# imap
# describe port(143) do
#   it { should be_listening }
# end

# imaps
# describe port(993) do
#   it { should be_listening }
# end

# pop3
# describe port(110) do
#   it { should be_listening }
# end

# pop3s
# describe port(995) do
#   it { should be_listening }
# end

# http
# describe port(80) do
#   it { should be_listening }
# end

# https
# describe port(443) do
#   it { should be_listening }
# end
