# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::cloud' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # it 'includes default recipe' do
  #   expect(chef_run).to include_recipe 'paramount::default'
  # end

  # it 'includes prosody recipe' do
  #   expect(chef_run).to include_recipe 'paramount::_prosody'
  # end
end
