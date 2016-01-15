# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'

Object.send(:remove_const, 'LOG_LEVEL') if Object.send(:const_defined?, 'LOG_LEVEL')
::LOG_LEVEL = :fatal

Object.send(:remove_const, 'UBUNTU_OPTS') if Object.send(:const_defined?, 'UBUNTU_OPTS')
::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '14.04',
  log_level: LOG_LEVEL
}.freeze

Object.send(:remove_const, 'CHEFSPEC_OPTS') if Object.send(:const_defined?, 'CHEFSPEC_OPTS')
::CHEFSPEC_OPTS = {
  log_level: LOG_LEVEL
}.freeze

at_exit { ChefSpec::Coverage.report! }
