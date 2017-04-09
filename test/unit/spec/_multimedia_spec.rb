# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_multimedia' do
  before { stub_resources }

  context 'common case' do
    let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

    %w(plexapp).each do |cb|
      it "includes recipe #{cb}" do
        expect(chef_run).to include_recipe(cb)
      end
    end
  end
end
