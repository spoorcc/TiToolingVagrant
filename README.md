
# ULP - distributable development environment

This setup will create a common development environment for TI MSP430.

Vagrant is used to manage Virtualbox 

## Install Dependencies
* [Vagrant](https://www.vagrantup.com)  : Abstract manager for several Hypervisors
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads) : Hypervisor (make sure HyperV is disabled ot sue this)
* [Virtualbox Extension pack](https://www.virtualbox.org/wiki/Downloads) : Extension pack needed for interacting with USB devices

### Needed vagrant plugins
* [vagrant reload plugin](https://github.com/aidanns/vagrant-reload)
* [vagrant plugin vbguest] (Plugin to make sure guest-additions is the same in guest as in host for solving sharing folders)

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-reload
```
# CCS install options
CCS is installed with a certain set of options according to a "response file".
In order to generate a new options file run the following command:
```
# /tmp/CCS7.3.0.00019_linux-x64/ccs_setup_linux64_7.3.0.00019.bin  --save-response-file /vagrant/my_install_options.txt --skip-install true
```
This will run the installer and save all the settings in `my_install_options.txt`

