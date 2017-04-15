# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::security' do
  before { stub_resources }

  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  %w[selinux firewall fail2ban rkhunter openssl aide].each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe(recipe)
    end
  end

  it 'creates ssl directory with an explicit action' do
    expect(chef_run).to create_directory('/etc/httpd/ssl')
  end

  # selinux_state[SELinux Permissive]
  # openssl_x509[/etc/httpd/ssl/example.com.pem]
end
