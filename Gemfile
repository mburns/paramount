# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

group :plugins do
  gem 'vagrant-berkshelf', github: 'berkshelf/vagrant-berkshelf'
  gem 'vagrant-omnibus', github: 'schisamo/vagrant-omnibus'
  gem 'vagrant-cachier', github: 'fgrehm/vagrant-cachier'
end

group :style do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop', '~> 0.24'
end

group :unit do
  gem 'berkshelf', '~> 3'
  gem 'chefspec', '~> 4'
  gem 'chef-sugar'
end

group :integration do
  gem 'test-kitchen', '~> 1.4.0'
  gem 'kitchen-vagrant', '~> 0.18.0'
end

group :guard do
  gem 'guard', '~> 2.12.5'
  gem 'guard-foodcritic', '>= 1.0'
  gem 'guard-kitchen', '~> 0.0.2'
  gem 'guard-rubocop', '~> 1.2.0'
  gem 'guard-rspec', '~> 4.5.0'
end
