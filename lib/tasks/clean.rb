require_relative '../rake_helper'

desc 'Clean some generated files'
task :clean do
  %w[
    Berksfile.lock
    .bundle
    .cache
    coverage
    Gemfile.lock
    .kitchen
    metadata.json
    vendor
  ].each { |f| FileUtils.rm_rf(Dir.glob(f)) }
end
