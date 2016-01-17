require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::clamav' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge described_recipe }

  it 'installs clamav-daemon' do
    expect(chef_run).to install_package 'clamav-daemon'
  end

  %w(paramount::amavis clamav).each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe(recipe)
    end
  end
end
