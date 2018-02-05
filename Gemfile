# encoding: UTF-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

ruby '2.3.1'

gem 'berkshelf', '~> 5.1'
gem 'chef', '~> 12.9.41'

group :plugins do
  gem 'kitchen-vagrant'
  gem 'vagrant-berkshelf'
  gem 'vagrant-cachier'
  gem 'vagrant-omnibus'
end

group :maintain do
  gem 'rake', '~> 11'
  gem 'stove'
end

group :development do
  gem 'github_changelog_generator'
  gem 'guard'
  gem 'guard-foodcritic'
  gem 'guard-kitchen'
  gem 'guard-rspec'
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

group :unit do
  gem 'chefspec'
  gem 'fauxhai'
  gem 'rspec'
  gem 'rspec-json_expectations'
end

group :integration do
  gem 'kitchen-docker', '~> 2.6'
  gem 'test-kitchen', '~> 1.13'
end
