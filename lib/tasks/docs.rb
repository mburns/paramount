require_relative '../rake_helper'

desc 'Generate Ruby documentation using yard'
task :yard do
  require 'yard'
  YARD::Rake::YardocTask.new do |t|
    t.stats_options = %w[--list-undoc]
  end
end

desc 'Generate Ruby documentation'
task doc: %w[yard]
