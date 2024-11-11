Vagrant.configure("2") do |config|
    config.vm.define "master" do |master|
        master.vm.box = "debian/bullseye64"
        master.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
      end
      master.vm.hostname = "master"
      master.vm.network "private_network", ip: "10.0.0.16", netmask:"255.255.255.0"
      master.vm.network "forwarded_port", guest: 6443, host: 6443
      master.vm.provision "shell", path: "./debian11-setup.sh"
      master.vm.provision "shell", path: "./provision-master.sh"
    end
    (1..3).each do |i|
        config.vm.define "worker#{i}" do |node|
            node.vm.box = "debian/bullseye64"
            node.vm.provider "virtualbox" do |vb|
                vb.memory = 2048
                vb.cpus = 2
        end
        node.vm.hostname = "worker#{i}"
        node.vm.network "private_network", ip: "10.0.0.#{17+i}", netmask:"255.255.255.0"
        node.vm.provision "shell", path: "./debian11-setup.sh"
        node.vm.provision "shell", path: "./provision-worker.sh"
        end
    end
end