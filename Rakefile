#!/usr/bin/env rake

# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'bundler/setup'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

$stdout.sync = true
$stderr.sync = true

Dir.glob('lib/tasks/**/*.rb').each { |r| load r }

task default: %w(style:all unit)
