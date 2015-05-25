require 'chefspec'
require_relative 'spec_helper'

describe 'sovereign::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  expect(chef_run).to render_file('/etc/hosts')
  expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.cfg')
  expect(chef_run).to render_file('/etc/ssh/sshd_config')
  expect(chef_run).to render_file('/etc/sudoers')
  expect(chef_run).to render_file('/etc/sysctl.conf')

  expect(chef_run).to install_package('vim')
  expect(chef_run).to install_package('htop')
  expect(chef_run).to install_package('postgresql')
  #expect(chef_run).to install_package('nginx')
  #expect(chef_run).to install_package('dovecot')
  #expect(chef_run).to install_package('rsyslog')

  expect(chef_run).to install_service('fail2ban')
  expect(chef_run).to install_service('chef-client')
  #expect(chef_run).to install_service('nginx')
  #expect(chef_run).to install_service('roundcube')
  #expect(chef_run).to install_service('owncloud')
  #expect(chef_run).to install_service('spamassassin')
end
