# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::dkim' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new.tap do |runner|
      # runner.node.set['paramount']['domain'] = 'you-should-write-more-specs.com'
    end.converge described_recipe
  end

  it 'includes opendkim' do
    expect(chef_run).to include_recipe('opendkim')
  end

  # /etc/opendkim/keys/example.com/20150615.private'
  # /etc/opendkim/keys/example.com/20150615.txt'
  %w(
    /etc/opendkim/SigningTable
  ).each do |file|
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
end
