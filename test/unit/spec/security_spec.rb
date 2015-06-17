# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::security' do
  before(:each) do
    stub_command('which sudo').and_return(false)
  end

  context 'common case' do
    let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

    # it 'writes sshd config' do
    #   expect(chef_run).to render_file('/etc/ssh/sshd_config')
    # end
  end
end
