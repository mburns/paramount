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

desc 'Run tests on Travis'
task ci: %w(style:all test:spec)

desc 'All tests'
task test: %w(style:all test:spec test:integration:vagrant)

task default: %w(style:all)
