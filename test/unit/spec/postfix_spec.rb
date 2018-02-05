# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'spec_helper'

describe 'paramount::_postfix' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # it 'creates postfix user with an explicit action' do
  #   expect(chef_run).to create_user('postfix')
  # end

  # it 'creates postfix group with an explicit action' do
  #   expect(chef_run).to create_group('postfix')
  # end

  it 'installs sendmail' do
    expect(chef_run).to remove_package('sendmail')
  end

  # postgresql_database_user[postfix]
  # postgresql_database[postfix]
end
