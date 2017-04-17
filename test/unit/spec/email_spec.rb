# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::email' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  %w[clamav database::postgresql dspam].each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe(recipe)
    end
  end

  %w[dovecot amavis spamassassin postfix dkim].each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe("paramount::_#{recipe}")
    end
  end

  it 'creates /data directory with an explicit action' do
    expect(chef_run).to create_directory('/data')
  end

  it 'creates vmail user with an explicit action' do
    expect(chef_run).to create_user('vmail')
  end

  it 'creates vmail group with an explicit action' do
    expect(chef_run).to create_group('vmail')
  end

  it 'installs nginx' do
    expect(chef_run).to install_package('postgrey')
  end
end
