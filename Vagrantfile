Vagrant.configure("2") do |o|
	o.vm.box = "ubuntu/trusty64"
	o.vm.provider "virtualbox" do |v|
		v.memory = 2048
		v.cpus = 2
	end
	
	o.vm.define "master" do |master|
		master.vm.hostname = "mtpuppetmaster"
		master.vm.provision :shell, path: "PuppetMaster.sh"
		master.vm.network "public_network", ip: "10.50.15.170"
		master.vm.provider "virtualbox" do |v|
			v.name = "Master"
		end

	end
	
	o.vm.define "agent" do |agent|
		agent.vm.hostname = "mtpuppetagent"
		agent.vm.provision :shell, path: "PuppetAgent.sh"
		agent.vm.network "public_network"
		agent.vm.provider "virtualbox" do |v|
			v.name = "Agent"
		end
	end
	
end
