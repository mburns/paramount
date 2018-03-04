# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'spec_helper'

describe 'paramount::_postfix' do
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
      end
    end
  end
end
