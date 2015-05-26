# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

group :style, halt_on_fail: true do
  guard 'foodcritic',
        cli: '--exclude spec',
        cookbook_paths: '.',
        all_on_start: false do
    watch(%r{attributes/.+\.rb$})
    watch(%r{definitions/.+\.rb$})
    watch(%r{libraries/.+\.rb$})
    watch(%r{providers/.+\.rb$})
    watch(%r{recipes/.+\.rb$})
    watch(%r{resources/.+\.rb$})
    watch(%r{templates/.+\.erb$})
    watch('metadata.rb')
  end

  guard :rubocop, all_on_start: false do
    watch(%r{.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
    watch('Berksfile')
    watch('Gemfile')
    watch('Guardfile')
    watch('Rakefile')
    watch('Thorfile')
    watch('Vagrantfile')
  end
end

group :unit do
  guard :rspec,
        cmd: 'bundle exec rspec',
        all_on_start: false do
    watch(%r{^test/spec/(.+)_spec\.rb$})
    watch(%r{^(recipes)/(.+)\.rb$})   { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^spec/.+_spec\.rb$})
    watch('spec/spec_helper.rb')      { 'spec' }
  end
end

group :integration do
  guard :kitchen,
        all_on_start: false do
    watch(%r{^attributes/(.+)\.rb$})
    watch(%r{^files/(.+)})
    watch(%r{^definitions/.+\.rb$})
    watch(%r{^libraries/.+\.rb$})
    watch(%r{^providers/.+\.rb$})
    watch(%r{^recipes/(.+)\.rb$})
    watch(%r{^resources/.+\.rb$})
    watch(%r{^templates/(.+)})
    watch(%r{^test/.+})
    watch('metadata.rb')
    watch('Berksfile')
  end
end

scope groups: [:style, :unit]
