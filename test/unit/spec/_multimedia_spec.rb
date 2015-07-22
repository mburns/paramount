# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::_multimedia' do
  context 'common case' do
    let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

    %w(couchpotato sabnzbd sickbeard plexapp).each do |cb|
      it "includes recipe #{cb}" do
        expect(chef_run).to include_recipe(cb)
      end
    end
  end
end
