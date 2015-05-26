require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'

# Uncomment to use ChefSpec's Berkshelf extension
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.formatter = :documentation

  # Specify the Chef log_level (default: :warn)
  config.log_level = :warn

  # Specify the path to a local JSON file with Ohai data
  # config.path = 'ohai.json'

  # Specify the operating platform to mock Ohai data from
  config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from
  config.version = '14.04'
end

def stub_resources
end

at_exit { ChefSpec::Coverage.report! }
