# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

ruby '2.3.1'

gem 'chef', '~> 12.9.41'

group :plugins do
  gem 'vagrant-berkshelf'
  gem 'vagrant-cachier'
  gem 'vagrant-omnibus'
end

group :maintain do
  gem 'rake', '~> 11'
  gem 'stove'
end

group :development do
  gem 'guard'
  gem 'guard-foodcritic'
  gem 'guard-kitchen'
  gem 'guard-rubocop'
  gem 'highline', '~> 1.7.8', '>= 1.7.8' # Used for input in Rake tasks.
  gem 'thor-scmversion'
end

group :test do
  gem 'chef-encrypted-attributes'
  gem 'chef-sugar'
  gem 'codecov'
  gem 'coveralls', require: false
  gem 'fog'
  gem 'mime-types'
  gem 'pry'
end

group :style do
  gem 'foodcritic'
  gem 'jsonlint'
  gem 'rubocop'
  gem 'yamllint'
end

group :spec do
  gem 'berkshelf'
  gem 'chefspec'
  gem 'rspec'
  gem 'rspec-json_expectations'
end

group :integration do
  gem 'kitchen-vagrant'
  gem 'test-kitchen'
end
gem 'nokogiri', '>= 1.7.2'
