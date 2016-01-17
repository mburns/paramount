require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::roundcube' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge described_recipe }

  before do
    stub_command('which nginx').and_return false
    stub_command('test -d /etc/php5/fpm/pool.d || mkdir -p /etc/php5/fpm/pool.d').and_return false
  end

  %w(php-fpm nginx roundcube::install roundcube::configure).each do |recipe|
    it "includes #{recipe}" do
      expect(chef_run).to include_recipe recipe
    end
  end
end
