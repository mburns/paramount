# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_web' do
  before(:each) do
    stub_command('which nginx').and_return false
    stub_command('which sudo').and_return false
    stub_command('test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d').and_return true
  end

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  %w(chef_nginx paramount::wallabag).each do |recipe|
    it "Includes recipe: #{recipe}" do
      expect(chef_run).to include_recipe(recipe)
    end
  end

  it 'installs nginx' do
    expect(chef_run).to install_package 'nginx'
  end
end
