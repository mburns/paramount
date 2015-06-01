require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::default' do
  before(:each) do
    stub_command('which sudo').and_return(false)
    stub_resources
  end

  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  %w(
    paramount::security
    paramount::system
    paramount::web
    paramount::email
    paramount::cloud
  ).each do |cb|
    it "Includes recipe: #{cb}" do
      expect(chef_run).to include_recipe(cb)
    end
  end
end
