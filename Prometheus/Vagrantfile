Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.define "prometheus" do |prometheus|
        config.vm.hostname = "prometheus"
        config.vm.network "forwarded_port", guest: 7000, host: 9090, id: 'Prometheus'
        config.vm.synced_folder ".", "/opt/"
        config.vm.network :public_network, :bridge => 'Realtek PCIe GbE Family Controller',:use_dhcp_assigned_default_route => true
    end

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
    end

    config.vm.provision "shell", inline: <<-SHELL

    sudo apt update && sudo apt-get upgrade -y
    sudo apt install docker docker.io -y

    cd /opt/ && sudo docker build -t my-prometheus . && \
    sudo docker run -p 9090:9090 my-prometheus



    SHELL
end