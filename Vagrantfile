Vagrant.configure("2") do |config|
    config.vm.define "runner" do |runner|
        runner.vm.box = "debian/bullseye64"
        runner.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
      end
      runner.vm.hostname = "runner"
      runner.vm.network "private_network", ip: "10.0.0.15", netmask:"255.255.255.0"
      runner.vm.provision "shell", path: "./debian11-setup.sh"
      runner.vm.provision "shell", path: "./provision-runner.sh"
    end
    config.vm.define "shepherd" do |shepherd|
        shepherd.vm.box = "debian/bullseye64"
        shepherd.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
      end
      shepherd.vm.hostname = "shepherd"
      shepherd.vm.network "private_network", ip: "10.0.0.16", netmask:"255.255.255.0"
      shepherd.vm.provision "shell", path: "./debian11-setup.sh"
      shepherd.vm.provision "shell", path: "./provision-shepherd.sh"
    end
    config.vm.define "herd1" do |herd1|
        herd1.vm.box = "debian/bullseye64"
        herd1.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
      end
      herd1.vm.hostname = "herd1"
      herd1.vm.network "private_network", ip: "10.0.0.17", netmask:"255.255.255.0"
      herd1.vm.provision "shell", path: "./debian11-setup.sh"
      herd1.vm.provision "shell", path: "./provision-herd.sh"
    end
    config.vm.define "herd2" do |herd2|
        herd2.vm.box = "debian/bullseye64"
        herd2.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
      end
      herd2.vm.hostname = "herd2"
      herd2.vm.network "private_network", ip: "10.0.0.18", netmask:"255.255.255.0"
      herd2.vm.provision "shell", path: "./debian11-setup.sh"
      herd2.vm.provision "shell", path: "./provision-herd.sh"
    end
end