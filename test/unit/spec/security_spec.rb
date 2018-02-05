# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::security' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  # selinux_state[SELinux Permissive]
  # openssl_x509[/etc/nginx/ssl/example.com.pem]
end
