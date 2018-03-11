# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_dpush' do
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

          # yum_package[d-push]
          # yum_package[php5-imap]
          # nginx_site[d-push]
          # cookbook_file[/etc/d-push/config.php]
          # apt_package[d-push]
          # apt_package[php5-imap]

          it 'converges successfully' do
            expect { :chef_run }.to_not raise_error
          end
        end
      end
    end
  end
end
