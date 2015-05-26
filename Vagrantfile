# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.5.0'

Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  else
    STDERR.puts "Install plugin:\n$ vagrant plugin install vagrant-cachier"
  end

  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = '12.3.0'
  end

  config.vm.hostname = 'sovereign.local'

  config.vm.box = 'boxcutter/ubuntu1404'

  config.vm.network :private_network, type: 'dhcp'
  config.vm.network 'forwarded_port', guest: 80, host: 8080

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.formatter = ENV.fetch('CHEF_FORMAT', 'null').downcase.to_sym
    chef.log_level = ENV.fetch('CHEF_LOG', 'info').downcase.to_sym

    chef.json = {
    }

    chef.run_list = %w(
      recipe[apt]
      recipe[sovereign::default]
    )
  end
end
