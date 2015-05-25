source 'https://rubygems.org'

gem 'berkshelf'

group :plugins do
  gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
  gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
  gem "vagrant-cachier", github: "fgrehm/vagrant-cachier"
end

group :development do  
  gem 'test-kitchen', '~> 1.4.0'
  gem 'kitchen-vagrant', '~> 0.18.0'
  gem 'guard', '~> 2.12.5'
  gem 'guard-kitchen', '~> 0.0.2'
  gem 'guard-foodcritic', '>= 1.0'
  gem 'foodcritic', '>= 3.0'
  gem 'guard-rubocop', '~> 1.2.0'
  gem 'guard-rspec', '~> 4.5.0'
  gem 'chefspec', '>= 3.1'
end
