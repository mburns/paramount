require 'jsonlint/rake_task'
require 'yamllint/rake_task'
require 'foodcritic'

require_relative '../rake_helper'

namespace :style do
  desc 'Lint ERB templates'
  task :erblint do
    puts 'Syntax checking ERB templates...'
    Dir.glob('**/*.erb').each do |f|
      next if f.start_with?('berks-cookbooks/', 'cookbooks/', 'vendor/') # skip vendored things
      abort_on_failure("erb -x -T '-' #{f} | ruby -c", "** Failed: #{f}")
    end
  end

  YamlLint::RakeTask.new do |t|
    t.paths = %w(
      **/.*.{yml,yaml}
      **/*.{yml,yaml}
    )
    t.exclude_paths = %w(
      vendor/**/.*.{yml,yaml}
      vendor/**/*.{yml,yaml}
    )
  end

  JsonLint::RakeTask.new do |t|
    t.paths = %w(
      test/fixtures/**/*.json
    )
  end

  FoodCritic::Rake::LintTask.new do |t|
    t.options = {
      fail_tags: ['any'],
      cookbook_paths: ['.', 'test/fixtures/cookbooks'],
      tags: [
        '~FC001', # Don't enforce strings-over-symbols to access node attrs.
        '~FC005', # Don't care about repetition resource declarations.
        '~FC023', # Don't prefer conditional attributes.
        '~FC048', # Don't prefer Mixlib::ShellOut.
        '~FC075'  # Don't avoid node.save
      ],
    }
  end

  require 'cookstyle'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new do |task|
    task.options << '--display-cop-names'
  end

  desc 'Run all style checks'
  task all: %i(rubocop foodcritic erblint jsonlint yamllint)
end
