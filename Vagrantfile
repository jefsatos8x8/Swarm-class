$mybridge = "wlp3s0"
$keypairs = "~/pairs/Vagrant"
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.hostname = "docker-class-0"
    config.vm.network :public_network, bridge: "#$mybridge",ip: "192.168.0.200"
    config.ssh.insert_key = false
    config.ssh.private_key_path = ["#$keypairs/vagrant", "~/.vagrant.d/insecure_private_key"]
    config.vm.provision "file", source: "#$keypairs/vagrant.pub", destination: "~/.ssh/authorized_keys"
    config.vm.synced_folder "~/Documents/OPS/DOCKER/AULAS/VAGRANT/", "/home/vagrant/Docker/"
    config.vm.provision "shell", path: "docker-install.sh"

    config.vm.provider :virtualbox do |vb|
        vb.name = "docker-class-01"
        vb.memory = "2048"
        vb.cpus = "1"        
      end
    
    $MACHINE = "docker-class"
    N = 2

    (1..2).each do |i|
      config.vm.define "#$MACHINE-#{i}" do |node|
          node.vm.hostname = "#$MACHINE-#{i}"
          node.vm.box = "ubuntu/focal64"
          node.vm.network :public_network, bridge: "#$mybridge", ip: "192.168.0.#{200+i}"
          node.ssh.insert_key = false
          node.ssh.private_key_path = ["#$keypairs/vagrant", "~/.vagrant.d/insecure_private_key"]
          node.vm.provision "file", source: "#$keypairs/vagrant.pub", destination: "~/.ssh/authorized_keys"
          node.vm.provision "shell", path: "docker-install.sh"
      end
    end
end