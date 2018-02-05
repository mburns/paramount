#
# Cookbook:: Paramount
# Library:: helpers
#

module Paramount
  # Helper functions for Paramount
  module Helpers
    def resolv_mx(domain)
      require 'resolv'
      Resolv::DNS.new.getresources(domain, Resolv::DNS::Resource::IN::MX)
    end
  end
end

Chef::Recipe.send(:include, ::Paramount::Helpers)
Chef::Resource.send(:include, ::Paramount::Helpers)
Chef::Provider.send(:include, ::Paramount::Helpers)
