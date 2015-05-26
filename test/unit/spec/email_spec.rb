require 'chefspec'
require_relative 'spec_helper'

describe 'sovereign::email' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
end
