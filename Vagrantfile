# 🇧🇷
# Este Vagrantfile será utilizado para criar 3 máquinas
# estas máquinas serão usadas para criar um cluster para o Docker Swarm
# Todas variáveis declaradas abaixo são da minha máquina
#
# 🇺🇸
# Possible english translate
# This Vagrantfile will be used to create 3 machines
# and those machines will be used to make a Docker Swarm cluster
# All variables declared below it's from my machine
#
# Jefferson Santos
# 15/12/2021
#
# Variáveis / Variables
$mybridge = "wlp3s0"
$keypairs = "~/pairs/Vagrant"
$syncfiles = "~/Documents/OPS/DOCKER/AULAS/VAGRANT/"

# Configuração inicial / Initial config
Vagrant.configure("2") do |config|

# Declarações do Loop / Declarations from loop 
$MACHINE = "docker-swarm"
N = 3

# Fazendo o loop / Doing loop
(0..2).each do |i|

  # Definições das máquinas / Machines definition
  config.vm.define "#$MACHINE-#{i}" do |node|

  # Definição do nome / Name definiton
  node.vm.hostname = "#$MACHINE-#{i}"

  # OS da imagem / OS image
      node.vm.box = "ubuntu/focal64"

      # Configuração da interface de rede / Network interface config
      node.vm.network :public_network, bridge: "#$mybridge", ip: "192.168.0.#{200+i}"

      # Ssh sem senha / Ssh without password          
      node.ssh.insert_key = false
      node.ssh.private_key_path = ["#$keypairs/vagrant", "~/.vagrant.d/insecure_private_key"]
      node.vm.provision "file", source: "#$keypairs/vagrant.pub", destination: "~/.ssh/authorized_keys"

      # Sincronizando pasta do host / Host sync folder
      node.vm.synced_folder "#$syncfiles", "/home/vagrant/Docker/"

      # Instalando o Docker / Docker install
      node.vm.provision "shell", path: "docker-install.sh"


      # Definição de Memória/CPU / Memory/CPU definition
      node.vm.provider :virtualbox do |swarm|
        swarm.name = "#$MACHINE-#{i}"
        swarm.customize = ["modifyvm", :id, "--cpuexecutioncap", "20",
                          "--memory", "512" 
                          ]
      end                      
    end
  end
end