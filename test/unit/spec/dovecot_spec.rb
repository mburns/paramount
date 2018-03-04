# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_dovecot' do
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

          it 'runs sievec execute with an explicit action' do
            expect(chef_run).to_not run_execute('sievec sieve_global_path')
          end

          it 'creates sieve directory with an explicit action' do
            expect(chef_run).to create_directory('/etc/dovecot/sieve')
          end

          it 'creates sieve template with an explicit action' do
            expect(chef_run).to create_template('/etc/dovecot/sieve/default.sieve')
          end

          # ssl_certificate[dovecot2]
        end
      end
    end
  end
end
