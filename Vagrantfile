# -*- mode: ruby -*-
# vi: set ft=ruby :

# Since virtualbox will only attach an USB device if it is plugged in after booting the VM, replug the USB

Vagrant.configure("2") do |config|

    # Virtual machine to create
    node =  { :name=>'ccsv7', :platform => 'linux',   :box => 'bento/ubuntu-16.04',   :cpus => 2, :memory => "2048"}
			      
    # USB devices to share
    devices = [{ :name => 'TI devices', :vendor_id => '0x0451'}]
      
    # ---------------------------------------------------------------------------------------------------------------------
    # All machine specific settings
	config.vm.define node[:name] do |machine|
		machine.vm.box = node[:box]
		machine.vm.hostname = node[:name] # Will force restart first time this is changed
	
		# Let the name in VirtualBox be the same as the image/hostname
		machine.vm.provider "virtualbox" do |vb|
			vb.name = node[:name]
			vb.memory = node[:memory]
			vb.cpus = node[:cpus]
	
			# Always open a gui
			vb.gui = true
	
			# Increase video ram for more smooth performance
			vb.customize ["modifyvm", :id, "--vram", "128"]
			vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]

			# Disconnect the UART to prevent any serial problems (e.g. ubuntu/xenial64)
			vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
	
			# Enable USB & USB 2.0
			vb.customize ["modifyvm", :id, "--usb", "on"]
			vb.customize ["modifyvm", :id, "--usbehci", "on"]
			vb.customize ["modifyvm", :id, "--usbxhci", "off"]
						  
			if (not provisioned?(node[:name])) || explicit_provisioning?
				# Share USB device for all Vagrant machines
				# For reference see http://www.virtualbox.org/manual/ch08.html#vboxmanage-controlvm
				devices.each do |device|
					vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', device[:name],
								  '--vendorid', device[:vendor_id]]
				end
			end
		end		
		
		# Install lightweight desktop-environment
		config.vm.provision "shell",
			inline: "apt-get --yes --force-yes update && apt-get install -y lubuntu-desktop"
				
		# Reboot the machine to have desktop environment available - requirement for TI installer
		machine.vm.provision :reload
		
		# Install TI tooling (Code Composer) on machine from script
		machine.vm.provision :shell do |s|
			s.path = "install_ti_tooling.sh"
		end
	end

end

def provisioned?(vm_name='default', provider='virtualbox')
  File.exists?(File.join(File.dirname(__FILE__),".vagrant/machines/#{vm_name}/#{provider}/action_provision"))
end

def explicit_provisioning?()
   (ARGV.include?("reload") && ARGV.include?("--provision")) || ARGV.include?("provision")
end

