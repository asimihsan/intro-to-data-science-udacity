# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|    
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  # ---------------------------------------------------------------------------
  #   Ubuntu 12.04.3 LTS.
  # ---------------------------------------------------------------------------
  config.vm.define "default" do |default|
    default.vm.box = "ubuntu-12.04.3"
    default.vm.box_url = "http://nitron-vagrant.s3-website-us-east-1.amazonaws.com/vagrant_ubuntu_12.04.3_amd64_virtualbox.box"
    default.vm.network "forwarded_port", guest: 8888, host: 58888, host_ip: "0.0.0.0"
    default.vm.provision :shell, :path => "vagrant/shell/main.sh"
    default.vm.provision :puppet do |puppet|
      puppet.module_path = "vagrant/puppet/modules"
      puppet.manifests_path = "vagrant/puppet"
      puppet.manifest_file  = "init.pp"    
      puppet.options = "--verbose --debug --parser future"
    end
  end
  # ---------------------------------------------------------------------------
end
