require 'kitchen/rake_tasks'

require_relative '../rake_helper'

desc 'Run unit tests using RSpec'
task :unit do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.verbose = false if ENV['RSPEC_VERBOSE'].nil?
    t.rspec_opts = '--color --format progress'
    t.pattern = 'test/unit/**{,/*/**}/*_spec.rb'
  end
end

desc 'Run unit tests (alias)'
task spec: %w[unit]
