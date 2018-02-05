# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'spec_helper'

describe 'paramount::_roundcube' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # postgresql_database_user[roundcube_db]
  # postgresql_database[roundcube_db]
  # openssl_x509[/etc/nginx/ssl/roundcube.pem]
end
