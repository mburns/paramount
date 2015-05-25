# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  else
    STDERR.puts "Install required plugin with:\n$ vagrant plugin install vagrant-cachier"
  end

  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end

  config.vm.hostname = 'sovereign-berkshelf'

  config.vm.box = "boxcutter/ubuntu1404"

  config.vm.network :private_network, type: 'dhcp'

  config.vm.network "forwarded_port", guest: 80,    host: 8080
  # config.vm.network "forwarded_port", guest: 443,   host: 8443

  config.berkshelf.berksfile_path = "./Berksfile"
  config.berkshelf.enabled = true

  # config.berkshelf.only = []
  # config.berkshelf.except = []

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
      'recipe[sovereign::default]'
    ]
  end
end
