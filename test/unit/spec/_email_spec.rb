# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_email' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # %w(database::postgresql).each do |recipe|
  #   it "includes #{recipe} recipe" do
  #     expect(chef_run).to include_recipe(recipe)
  #   end
  # end

  # %w(default amavis clamav spamassassin postfix dkim).each do |recipe|
  #   it "includes #{recipe} recipe" do
  #     expect(chef_run).to include_recipe("paramount::#{recipe}")
  #   end
  # end

  it 'creates /data directory with an explicit action' do
    expect(chef_run).to create_directory('/data')
  end

  it 'creates vmail user with an explicit action' do
    expect(chef_run).to create_user('vmail')
  end

  it 'creates vmail group with an explicit action' do
    expect(chef_run).to create_group('vmail')
  end
end
