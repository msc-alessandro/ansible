IMAGE_NAME = "bento/ubuntu-18.04"
N = 2


Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    config.ssh.forward_agent = true
    config.ssh.private_key_path = File.expand_path('~/.ssh/insecure_private_key')

    config.vm.provider "hyperv" do |h|
        h.linked_clone = true
        h.maxmemory = 4096
        h.memory = 4096
        h.cpus = 2
    end

    config.vm.define "master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "master"
        master.vm.synced_folder "resources/", "/vagrant", disabled: false
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            node.vm.hostname = "node-#{i}"
        end
    end

    ## Change provision scheme here
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "k8s_site.yml"
        ansible.raw_arguments = ["--inventory", "inventory/vagrant/hosts.ini" ]
    end
end