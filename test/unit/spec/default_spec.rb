require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::default' do
  before(:each) do
    stub_command('which sudo').and_return false
    stub_command('ls /var/lib/postgresql/9.3/main/recovery.conf').and_return true
    stub_command("psql -c 'SELECT lanname FROM pg_catalog.pg_language' postfix | grep '^ plpgsql$'")
    stub_command('which nginx').and_return true
    stub_command('test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d').and_return true
  end

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  %w(
    paramount::_security
    paramount::_system
  ).each do |cb|
    it "includes recipe: #{cb}" do
      expect(chef_run).to include_recipe(cb)
    end
  end
end
