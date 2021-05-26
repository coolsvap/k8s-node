Vagrant.configure("2") do |config|
  config.env.enable
  config.vm.box = ENV["BOX_IMAGE"]
  config.vm.box_check_update = false

  config.vm.provider ENV["PROVIDER"] do |l|
    l.cpus = ENV["NODE_CPU"]
    l.memory = ENV["NODE_MEMORY"]
  end

  config.vm.provision :shell, :path => "install-node.sh"
  config.hostmanager.enabled = true
  config.hostmanager.manage_guest = true
  # config.vm.network "public_network"

  if ENV["SETUP_MASTER"]
    config.vm.define ENV["MASTER_HOSTNAME"] do |subconfig|
      subconfig.vm.hostname = ENV["MASTER_HOSTNAME"]
      subconfig.vm.network :private_network, ip: ENV["MASTER_IP"]
      subconfig.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--cpus", ENV["MASTER_CPU"]]
        vb.customize ["modifyvm", :id, "--memory", ENV["MASTER_MEMORY"]]
      end
    end
  end
end  
