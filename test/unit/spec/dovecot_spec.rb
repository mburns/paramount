# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_dovecot' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'includes dovecot' do
    expect(chef_run).to include_recipe('dovecot')
  end

  it 'runs sievec execute with an explicit action' do
    expect(chef_run).to_not run_execute('sievec sieve_global_path')
  end

  it 'creates sieve directory with an explicit action' do
    expect(chef_run).to create_directory('/etc/dovecot/sieve')
  end

  it 'creates sieve template with an explicit action' do
    expect(chef_run).to create_template('/etc/dovecot/sieve/default.sieve')
  end

  # ssl_certificate[dovecot2]
end
