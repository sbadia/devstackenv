# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
conf = ENV['conf'] || conf='./conf.yml'
#abort 'Please provide conf file (conf=./conf.yml)' unless ENV['conf']
conf_boxes = YAML::load_file(conf)

Vagrant.configure('2') do |config|
  conf_boxes.each_key do |v|
    config.vm.define :"stack-#{v}" do |n|
      n.vm.box = conf_boxes[v]['image']
      n.vm.hostname = "stack-#{v}.lab.enovance.com"
      n.vm.network :public_network
      n.vm.network :private_network, ip: conf_boxes[v]['ip_priv']
      n.vm.synced_folder conf_boxes[v]['dev_dir'], '/vagrant_dev'
      n.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id,'--memory', conf_boxes[v]['ram'],'--cpus',conf_boxes[v]['cpu']]
      end
      config.vm.provision "shell", path: "scripts/init-devstack.sh"
      # Provision puppet
      #n.vm.provision 'puppet' do |pp|
      #  pp.module_path = 'puppet-modules'
      #  pp.manifests_path = 'puppet-manifests'
      #  pp.manifest_file = 'devstack.pp'
      #  pp.options = "--verbose --debug --certname devstack"
      #  pp.facter = {
      #    'vagrant'     => true,
      #    'stack_name'  => v
      #  }
      #end
    end
  end
end
