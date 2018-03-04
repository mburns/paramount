# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'spec_helper'

describe 'paramount::_roundcube' do
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

          # postgresql_database_user[roundcube_db]
          # postgresql_database[roundcube_db]
          # openssl_x509[/etc/nginx/ssl/roundcube.pem]
        end
      end
    end
  end
end
