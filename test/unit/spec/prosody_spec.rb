# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'spec_helper'

describe 'paramount::_prosody' do
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

          it 'converges successfully' do
            expect { :chef_run }.to_not raise_error
          end

          # prosody_vhost[example.com]
          # prosody_user[admin]
          # prosody_module[roster]
          # prosody_module[saslauth]
        end
      end
    end
  end
end
