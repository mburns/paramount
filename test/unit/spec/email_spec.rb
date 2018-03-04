# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::email' do
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

          it 'creates /data directory with an explicit action' do
            expect(chef_run).to create_directory('/data')
          end

          it 'creates vmail user with an explicit action' do
            expect(chef_run).to create_user('vmail')
          end

          it 'creates vmail group with an explicit action' do
            expect(chef_run).to create_group('vmail')
          end

          it 'installs nginx' do
            expect(chef_run).to install_package('postgrey')
          end
        end
      end
    end
  end
end
