
# Distributable development environment for TI CCs

This setup will create a common development environment for TI Code Composer Studio.

Vagrant is used to manage Virtualbox 

## Install Dependencies
* [Vagrant](https://www.vagrantup.com)  : Abstract manager for several Hypervisors
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads) : Hypervisor (make sure HyperV is disabled ot sue this)
* [Virtualbox Extension pack](https://www.virtualbox.org/wiki/Downloads) : Extension pack needed for interacting with USB devices

### Needed vagrant plugins
* [vagrant reload plugin](https://github.com/aidanns/vagrant-reload) : Plugin to restart vm during provisioning
* [vagrant plugin vbguest](https://github.com/dotless-de/vagrant-vbguest) :Plugin to make sure guest-additions is the same in guest as in host for solving sharing folders

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-reload
```
## Usage

### Creating / Starting machine for first time
* Clone/download this repository:

```git clone https://github.com/spoorcc/TiToolingVagrant```

* Go into the directory

``` cd TiToolingVagrant ```

* Start the VM (first time needs to be done from commandline)

``` vagrant up ```

* A virtualbox VM will be created and all tooling downloaded and installed. Note: this can take more than ~90 minutes on slower systems.
* After that the machine can be used from either commandline or virtualbox directly.

### Destroying the machine
Since the configuration is all kept in source files, the machine can be destroyed at any time and recreated completly.

* From command line run: ```vagrant destroy```

# CCS install options
CCS is installed with a certain set of options according to a "response file".
In order to generate a new options file run the following command from within a VM:
```
# /tmp/CCS7.3.0.00019_linux-x64/ccs_setup_linux64_7.3.0.00019.bin  --save-response-file /vagrant/my_install_options.txt --skip-install true
```
This will run the installer and save all the settings in `my_install_options.txt`. This can replace the currently used install file.
