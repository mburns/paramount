# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

# /etc/rc.d/init.d/procps
# /etc/sysctl.d/99-chef-attributes.conf
# /etc/sudoers
# /etc/ntp.conf

%w[
  /etc/ssh/sshd_config
  /etc/ssh/ssh_config
  /etc/apt/sources.list
].each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_mode 644 }
  end
end
