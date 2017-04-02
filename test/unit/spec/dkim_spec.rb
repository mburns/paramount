# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::dkim' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new.tap do |runner|
      runner.node.set['paramount']['domain'] = 'you-should-write-more-specs.com'
    end.converge described_recipe
  end

  it 'includes opendkim' do
    expect(chef_run).to include_recipe 'opendkim'
  end

  %w(
    /etc/opendkim/SigningTable
    /etc/opendkim/keys/you-should-write-more-specs.com/20150615.private
    /etc/opendkim/keys/you-should-write-more-specs.com/20150615.txt
  ).each do |file|
    it "writes #{file}" do
      expect(chef_run).to render_file file
    end
  end
end
