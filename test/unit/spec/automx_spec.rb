# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_automx' do
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          @chef_run
        end

        context 'with default attributes' do
          before(:context) do
            @chef_run = ChefSpec::SoloRunner.new(platform: platform, version: version)
            stub_resources
            @chef_run.converge(described_recipe)
          end

          # yum_package[git]
          # git[/opt/automx]
          # template[/etc/automx.conf]
          # cookbook_file[/etc/automx.py]
          # directory[/var/log/automx]
          # file[/var/log/automx/automx.log]
          # apt_package[git]

          it 'converges successfully' do
            expect { :chef_run }.to_not raise_error
          end
        end
      end
    end
  end
end
