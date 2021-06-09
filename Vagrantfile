Vagrant.configure("2") do |config|
  config.env.enable
  config.vm.box = ENV["BOX_IMAGE"]
  config.vm.box_version = ENV["BOX_VERSION"]
  config.vm.box_check_update = false

  config.vm.provider ENV["PROVIDER"] do |l|
    l.cpus = ENV["NODE_CPU"]
    l.memory = ENV["NODE_MEMORY"]
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_guest = true
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision :shell, :path => "install-ansible.sh"
   
  config.vm.define ENV["HOSTNAME"] do |master|
    master.vm.hostname = ENV["HOSTNAME"]
    master.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "base.yaml"
      ansible.extra_vars = {
        node_ip: "127.0.0.1",
        kube_version: ENV["KUBE_VERSION"]
      }
    end
  end
end
