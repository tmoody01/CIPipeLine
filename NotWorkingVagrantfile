masterIP="10.50.15.97"

Vagrant.configure("2") do |o|
	o.vm.box = "ubuntu/trusty64"
	o.vm.provider "virtualbox" do |v|
		v.memory = 2048
		v.cpus = 2
	end
	
	o.vm.define "master" do |master|
		master.vm.hostname = "mtmaster"
		master.vm.provision :shell, path: "PuppetMaster.sh"
		master.vm.network "public_network", ip: masterIP
		master.vm.provider "virtualbox" do |v|
			v.name = "master"
		end
	end
	
	o.vm.define "agent" do |agent|
		agent.vm.hostname = "mtagent"
		agent.vm.provision :shell, :path => "PuppetAgent.sh", :args => masterIP
		agent.vm.network "public_network"
		agent.vm.provider "virtualbox" do |v|
			v.name = "agent"
		end
	end
	
end