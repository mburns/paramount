#!/usr/bin/env rake

# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'bundler/setup'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

$stdout.sync = true
$stderr.sync = true

Dir.glob('lib/tasks/**/*.rb').each { |r| load r }

desc 'Publish to Chef Supermarket'
namespace :maintain do
  require 'stove/rake_task'
  Stove::RakeTask.new
end

desc 'Run all style checks'
task style: %w(style:chef style:ruby)

desc 'Run tests on Travis'
task ci: %w(style spec)

desc 'All tests'
task test: %w(style spec integration:vagrant)

task default: %w(test)
