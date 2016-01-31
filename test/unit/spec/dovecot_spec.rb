# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::dovecot' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'includes dovecot' do
    expect(chef_run).to include_recipe 'dovecot'
  end
end
