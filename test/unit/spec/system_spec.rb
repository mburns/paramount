# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::system' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # it 'installs vim' do
  #   expect(chef_run).to install_package('vim')
  # end

  it 'writes sshd config' do
    expect(chef_run).to render_file('/etc/ssh/sshd_config')
  end
end
