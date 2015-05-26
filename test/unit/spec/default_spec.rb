require 'chefspec'
require_relative 'spec_helper'

describe 'sovereign::default' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  describe 'ubuntu' do
    expect(chef_run).to render_file('/etc/hosts')
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.cfg')
    expect(chef_run).to render_file('/etc/ssh/sshd_config')
    expect(chef_run).to render_file('/etc/sudoers')
    expect(chef_run).to render_file('/etc/sysctl.conf')

    expect(chef_run).to install_package('vim')
    expect(chef_run).to install_package('htop')
    # expect(chef_run).to install_package('rsyslog')
    # expect(chef_run).to install_service('chef-client')
  end
end
