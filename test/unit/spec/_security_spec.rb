# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_security' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # %w(firewall fail2ban rkhunter openssl).each do |recipe|
  #   it "includes #{recipe} recipe" do
  #     expect(chef_run).to include_recipe(recipe)
  #   end
  # end

  it 'creates ssl directory with an explicit action' do
    expect(chef_run).to create_directory('/etc/httpd/ssl')
  end
end
