# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

gem 'chef', '~> 12.8.1'

group :plugins do
  gem 'vagrant-berkshelf', '~> 4.1'
  gem 'vagrant-cachier', '~> 1.2'
  gem 'vagrant-omnibus', '~> 1.5'
end

group :maintain do
  gem 'rake'
  gem 'stove'
end

group :development do
  # gem 'coveralls'
  gem 'thor-scmversion'
  gem 'guard'
  gem 'guard-kitchen'
  gem 'guard-foodcritic'
  gem 'guard-rubocop'
end

group :test do
  gem 'chef-sugar'
  gem 'pry'
  gem 'codecov'
end

group :style do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop'
end

group :spec do
  gem 'berkshelf', '~> 4'
  gem 'chefspec', '~> 4'
end

group :integration do
  gem 'test-kitchen', '~> 1.4.0'
  gem 'kitchen-vagrant', '~> 0.18.0'
end
