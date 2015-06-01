# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::web' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
end
