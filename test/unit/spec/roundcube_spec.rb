# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'spec_helper'

describe 'paramount::_roundcube' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # roundcube::install roundcube::configure
  %w[
    encrypted_attributes
    php-fpm
  ].each do |recipe|
    it "includes #{recipe}" do
      expect(chef_run).to include_recipe recipe
    end
  end

  # postgresql_database_user[roundcube_db]
  # postgresql_database[roundcube_db]
  # openssl_x509[/etc/httpd/ssl/roundcube.pem]
end
