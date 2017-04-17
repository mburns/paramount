# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'spec_helper'

describe 'paramount::_postgrey' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'creates postgrey template with an explicit action' do
    expect(chef_run).to create_template('/etc/default/postgrey')
  end

  # service[postgrey]
end
