# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_amavis' do
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

          it 'installs amavisd-new' do
            expect(chef_run).to install_package 'amavisd-new'
          end

          it 'writes 01-basic config' do
            expect(chef_run).to render_file '/etc/amavis/conf.d/01-basic'
          end

          %w[
            01-debian
            05-domain_id
            05-node_id
            15-av_scanners
            15-content_filter_mode
            20-debian_defaults
            21-ubuntu_defaults
            25-amavis_helpers
            30-template_localization
            40-policy_banks
            50-user
          ].each do |filename|
            it "deletes #{filename}" do
              expect(chef_run).to delete_file("/etc/amavis/conf.d/#{filename}")
            end
          end

          it 'creates amavis user with an explicit action' do
            expect(chef_run).to create_user('amavis')
          end

          it 'creates amavis group with an explicit action' do
            expect(chef_run).to create_group('amavis')
          end

          # service[amavis]
        end
      end
    end
  end
end
