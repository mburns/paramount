require_relative '../rake_helper'

desc 'Publish to Chef Supermarket'
namespace :maintain do
  require 'stove/rake_task'
  Stove::RakeTask.new
end
