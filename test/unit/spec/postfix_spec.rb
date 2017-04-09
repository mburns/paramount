# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::postfix' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # postgresql::server spostfixadmin::map_files
  %w[paramount::dkim].each do |recipe|
    it "includes #{recipe}" do
      expect(chef_run).to include_recipe recipe
    end
  end

  it 'creates postfix user with an explicit action' do
    expect(chef_run).to create_user('postfix')
  end

  it 'creates postfix group with an explicit action' do
    expect(chef_run).to create_group('postfix')
  end
end
