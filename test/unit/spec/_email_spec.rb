# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_email' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  before do
    stub_command('which sudo').and_return false
    stub_command('ls /var/lib/postgresql/9.3/main/recovery.conf').and_return true
    stub_command("psql -c 'SELECT lanname FROM pg_catalog.pg_language' postfix | grep '^ plpgsql$'")
    stub_command('which nginx').and_return true
    stub_command('test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d').and_return true
  end

  %w(encrypted_attributes database::postgresql).each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe(recipe)
    end
  end

  # dovecot postfixadmin
  %w(default amavis clamav spamassassin postfix dkim).each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe("paramount::#{recipe}")
    end
  end

  it 'creates /data directory with an explicit action' do
    expect(chef_run).to create_directory('/data')
  end

  it 'creates vmail user with an explicit action' do
    expect(chef_run).to create_user('vmail')
  end

  it 'creates vmail group with an explicit action' do
    expect(chef_run).to create_group('vmail')
  end
end
