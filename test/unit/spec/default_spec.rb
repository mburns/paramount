# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
# require_relative 'spec_helper'

describe 'paramount::default' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  %w[security system].each do |cb|
    it "Includes recipe: #{cb}" do
      expect(chef_run).to include_recipe("paramount::#{cb}")
    end
  end
end
