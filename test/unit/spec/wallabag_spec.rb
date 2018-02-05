# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_wallabag' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  %w[curl php5-tidy php-xml-parser].each do |package|
    it "installs #{package}" do
      expect(chef_run).to install_package package
    end
  end

  # ark[wallabag]
end
