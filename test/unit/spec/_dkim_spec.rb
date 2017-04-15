# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_dkim' do
  before { stub_resources }

  cached(:chef_run) do
    ChefSpec::ServerRunner.new.tap do |runner|
      # runner.node.set['paramount']['domain'] = 'you-should-write-more-specs.com'
    end.converge described_recipe
  end

  %w[
    /etc/opendkim/keys/example.com/20150615.private
    /etc/opendkim/keys/example.com/20150615.txt
    /etc/opendkim/SigningTable
  ].each do |file|
    it "writes #{file}" do
      expect(chef_run).to create_file(file)
    end
  end

  it 'creates /etc/opendkim directory with an explicit action' do
    expect(chef_run).to create_directory('/etc/opendkim')
  end

  it 'creates opendkim/keys/example.com directory with an explicit action' do
    expect(chef_run).to create_directory('/etc/opendkim/keys/example.com')
  end

  it 'includes opendkim' do
    expect(chef_run).to include_recipe('opendkim')
  end
end
