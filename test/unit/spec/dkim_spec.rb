# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_dkim' do
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

          %w(
            /etc/opendkim/keys/example.com/20150615.private
            /etc/opendkim/keys/example.com/20150615.txt
            /etc/opendkim/SigningTable
          ).each do |file|
            it "writes #{file}" do
              expect(chef_run).to create_file(file)
            end
          end

          it 'creates /etc/opendkim directory with an explicit action' do
            expect(chef_run).to create_directory('/etc/opendkim')
          end

          it 'creates opendkim/keys/example.com directory with an explicit action' do
            expect(chef_run).to create_directory('/etc/opendkim/keys/example.com')
          end

          it 'creates TrustedHosts file with an explicit action' do
            expect(chef_run).to create_cookbook_file('/etc/opendkim/TrustedHosts')
          end
        end
      end
    end
  end
end
