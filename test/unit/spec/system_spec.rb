# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::system' do
  before(:each) do
    stub_command('which sudo').and_return(false)
    stub_resources
  end

  context 'common case' do
    let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

    %w(packages openssh sysctl).each do |cb|
      it "Includes recipe: #{cb}" do
        expect(chef_run).to include_recipe(cb)
      end
    end

    it 'installs vim' do
      expect(chef_run).to install_package('vim')
    end

    it 'writes sshd config' do
      expect(chef_run).to render_file('/etc/ssh/sshd_config')
    end
  end
end
