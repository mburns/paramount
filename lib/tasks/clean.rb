require_relative '../rake_helper'

desc 'Clean some generated files'
task :clean do
  %w(
    .bundle
    .cache
    coverage
    .kitchen
    metadata.json
    vendor
    .DS_Store
  ).each { |f| FileUtils.rm_rf(Dir.glob(f)) }
end
