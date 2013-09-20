# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  vm = ['west','east']
  vm.each do |v|
    config.vm.define :"stack-#{v}" do |n|
      n.vm.box = 'ubuntu-1204'
      n.vm.hostname = "vpn-#{v}.lab.enovance.com"
      n.vm.network :public_network
      n.vm.synced_folder "/home/sbadia/dev", "/vagrant_dev"
      n.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id,"--memory", "1024","--cpus","1"]
      end
    end
  end
end
