# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::roundcube' do
  before do
    stub_command('which nginx').and_return false
    stub_command('test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d').and_return false
  end

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # roundcube::install roundcube::configure
  %w(php-fpm).each do |recipe|
    it "includes #{recipe}" do
      expect(chef_run).to include_recipe recipe
    end
  end
end
