# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "shell", inline: <<-SHELL
	su -c "mkdir -p mysetup" vagrant
  SHELL
  config.vm.provision "file", source: File.join(File.dirname(__FILE__), "files", ".emacs"), destination: "/home/vagrant/.emacs"
  config.vm.provision "file", source: File.join(File.dirname(__FILE__), "files", "emacs-script.el"), destination: "/home/vagrant/mysetup/emacs-script.el"

  config.vm.provision "shell", path: "provision.sh"

  config.vm.provision "shell", inline: <<-SHELL
   su -c "emacs --script /home/vagrant/mysetup/emacs-script.el" vagrant
  SHELL

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider :virtualbox do |vb|
     #vb.gui = true
  end

  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
end
