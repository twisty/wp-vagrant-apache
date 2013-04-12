# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "quantal32"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/quantal/current/quantal-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.forward_port 80, 8888
  config.vm.forward_port 3306, 3306
  config.vm.share_folder "vagrant-root", "/vagrant", "../", :owner=> "www-data", :group=>"www-data"
  config.vm.provision :shell, :inline => "apt-get update --fix-missing; apt-get -y upgrade"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "~/.puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
  end
end
