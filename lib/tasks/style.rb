require 'rubocop/rake_task'
require 'jsonlint/rake_task'
require 'yamllint/rake_task'
require 'foodcritic'

require_relative '../rake_helper'

namespace :style do
  desc 'Lint ERB templates'
  task :erblint do
    puts 'Syntax checking ERB templates...'
    Dir.glob('**/*.erb').each do |f|
      next if f.start_with?('cookbooks/', 'vendor/') # skip vendored things
      abort_on_failure("erb -x -T '-' #{f} | ruby -c", "** Failed: #{f}")
    end
  end

  YamlLint::RakeTask.new do |t|
    t.paths = %w(
      **/.*.{yml,yaml}
      **/*.{yml,yaml}
    )
  end

  JsonLint::RakeTask.new do |t|
    t.paths = %w(
      **/*.json
    )
  end

  FoodCritic::Rake::LintTask.new do |t|
    t.options = {
      fail_tags: ['any'],
      cookbook_paths: ['site-cookbooks', 'test/fixtures/cookbooks'],
      tags: [
      ]
    }
  end

  RuboCop::RakeTask.new

  desc 'Run all linters'
  task all: %i(erblint jsonlint yamllint rubocop foodcritic)
end
