# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_web' do
  let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  before(:each) do
    stub_command('which nginx').and_return false
  end

  %w(nginx paramount::wallabag).each do |recipe|
    it "Includes recipe: #{recipe}" do
      expect(chef_run).to include_recipe(recipe)
    end
  end

  it 'installs nginx' do
    expect(chef_run).to install_package 'nginx'
  end
end
