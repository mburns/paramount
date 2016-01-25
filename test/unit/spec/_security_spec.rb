# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_security' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  %w(firewall fail2ban rkhunter openssl).each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe(recipe)
    end
  end
end
