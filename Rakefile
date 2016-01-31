# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'bundler/setup'
require 'foodcritic'
require 'kitchen'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

namespace :style do
  begin
    require 'rubocop/rake_task'
    desc 'Run Ruby style checks'
    RuboCop::RakeTask.new(:ruby)
  rescue LoadError
    puts '>>>>> Rubocop gem not loaded, omitting tasks' unless ENV['CI']
  end

  begin
    require 'foodcritic'

    desc 'Run Chef style checks'
    FoodCritic::Rake::LintTask.new(:chef) do |t|
      t.options = {
        fail_tags: ['any']
      }
    end
  rescue LoadError
    puts '>>>>> foodcritic gem not loaded, omitting tasks' unless ENV['CI']
  end
end

# Rspec and ChefSpec
desc 'Run ChefSpec unit tests'
RSpec::Core::RakeTask.new(:spec) do |t, _args|
  t.rspec_opts = 'test/unit'
end

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end

  desc 'Test Kitchen with cloud plugins'
  task :cloud do
    if ENV['CI'] == 'true'
      Kitchen.logger = Kitchen.default_file_logger
      @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.cloud.yml')
      config = Kitchen::Config.new(loader: @loader)
      concurrency = config.instances.size
      queue = Queue.new
      config.instances.each { |i| queue << i }
      concurrency.times { queue << nil }
      threads = []
      concurrency.times do
        threads << Thread.new do
          while (instance = queue.pop)
            instance.test(:always)
          end
        end
      end
      threads.map(&:join)
    end
  end
end

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
