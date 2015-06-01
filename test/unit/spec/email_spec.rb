require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::email' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  # it 'installs dovecot' do
  #  expect(chef_run).to install_package('dovecot')
  # end
end
