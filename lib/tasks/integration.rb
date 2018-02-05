require 'rspec/core/rake_task'
require 'kitchen/rake_tasks'

require_relative '../rake_helper'

namespace :integration do
  desc 'Run integration tests using Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each { |instance| instance.test(:always) }
  end

  desc 'Run integration tests using Docker'
  task :docker, [:instance] do |_t, args|
    args.with_defaults(instance: 'default-ubuntu-1404')
    require 'kitchen'
    Kitchen.logger = Kitchen.default_file_logger
    loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.docker.yml')
    instances = Kitchen::Config.new(loader: loader).instances
    # Travis CI Docker service does not support destroy:
    instances.get(args.instance).verify
  end

  desc 'Run integration tests using The Cloud(TM)'
  task :cloud do
    Kitchen.logger = Kitchen.default_file_logger

    loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.cloud.yml')
    config = Kitchen::Config.new(loader: loader)

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
