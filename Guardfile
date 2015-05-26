guard 'kitchen' do
  watch(/test\/.+/)
  watch(/^recipes\/(.+)\.rb$/)
  watch(/^attributes\/(.+)\.rb$/)
  watch(/^files\/(.+)/)
  watch(/^templates\/(.+)/)
  watch(/^providers\/(.+)\.rb/)
  watch(/^resources\/(.+)\.rb/)
end

guard 'foodcritic', cookbook_paths: '.', all_on_start: false do
  watch(/attributes\/.+\.rb$/)
  watch(/providers\/.+\.rb$/)
  watch(/recipes\/.+\.rb$/)
  watch(/resources\/.+\.rb$/)
  watch(/^templates\/(.+)/)
  watch('metadata.rb')
end

guard :rspec, cmd: 'bundle exec rspec', all_on_start: false do
  watch(%r{^test/spec/(.+)_spec\.rb$})
  watch(/^(recipes)\/(.+)\.rb$/)   { |m| "spec/#{m[1]}_spec.rb" }
  watch('test/spec/spec_helper.rb')      { 'spec' }
end
