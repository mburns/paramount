# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

group :plugins do
  gem 'vagrant-berkshelf', github: 'berkshelf/vagrant-berkshelf'
  gem 'vagrant-omnibus', github: 'schisamo/vagrant-omnibus'
  gem 'vagrant-cachier', github: 'fgrehm/vagrant-cachier'
end

group :maintain do
  gem 'rake'
  gem 'stove'
end

group :test do
  gem 'berkshelf', '~> 3'
  gem 'chefspec', '~> 4'
  gem 'chef-sugar'
end

group :style do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop', '~> 0.24'
end

group :integration do
  gem 'test-kitchen', '~> 1.4.0'
  gem 'kitchen-vagrant', '~> 0.18.0'
end
