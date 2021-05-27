Vagrant.configure("2") do |config|
  config.env.enable
  config.vm.box = ENV["BOX_IMAGE"]
  config.vm.box_check_update = false

  config.vm.provider ENV["PROVIDER"] do |l|
    l.cpus = ENV["NODE_CPU"]
    l.memory = ENV["NODE_MEMORY"]
  end

  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision :shell, :path => "install-node.sh"
  config.hostmanager.enabled = true
  config.hostmanager.manage_guest = true
  config.vm.provision :file, source: './master.sh', destination:  "/opt"

  config.vm.define ENV["HOSTNAME"] do |subconfig|
    subconfig.vm.hostname = ENV["HOSTNAME"]
  end
end  

