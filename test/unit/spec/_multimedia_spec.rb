# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_multimedia' do
  before(:each) do
    stub_command('which sudo').and_return true
    stub_command('which nginx').and_return true
    stub_command('test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d').and_return true
  end

  context 'common case' do
    let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

    it 'includes default recipe' do
      expect(chef_run).to include_recipe 'paramount::default'
    end

    %w(plexapp).each do |cb|
      it "includes recipe #{cb}" do
        expect(chef_run).to include_recipe(cb)
      end
    end
  end
end
