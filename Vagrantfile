# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :master do |master_config|
    master_config.landrush.enabled = true

    master_config.vm.box = "ubuntu/trusty64"
    #master_config.vm.box_version = "<= 20160127.0.0"
    master_config.vm.host_name = 'saltmaster.local'
    #master_config.vm.network "public_network", ip: "192.168.50.10"
    master_config.vm.network "private_network", ip: "192.168.51.10"
    master_config.vm.synced_folder "salt/", "/srv/salt"
    master_config.vm.synced_folder "pillar/", "/srv/pillar"

    master_config.vm.provision :salt do |salt|
      salt.master_config = "etc/master"
      salt.master_key = "etc/certs/master_minion.pem"
      salt.master_pub = "etc/certs/master_minion.pub"
      salt.minion_key = "etc/certs/master_minion.pem"
      salt.minion_pub = "etc/certs/master_minion.pub"
      salt.seed_master = {
                          "minion1" => "etc/certs/minion1.pub",
                          "minion2" => "etc/certs/minion2.pub"
                         }

      salt.install_type = "stable"
      salt.install_master = true
      salt.no_minion = false
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.landrush.enabled = true

    minion_config.vm.box = "ubuntu/trusty64"
    #minion_config.vm.box_version = "<= 20160127.0.0"
    minion_config.vm.host_name = 'saltminion1.local'


    minion_config.vm.network "private_network", ip: "192.168.51.11"
    #minion_config.vm.network "public_network", ip: "192.168.50.11"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "etc/minion1"
      salt.minion_key = "etc/certs/minion1.pem"
      salt.minion_pub = "etc/certs/minion1.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.landrush.enabled = true
    minion_config.vm.box = "ubuntu/trusty64"
    #minion_config.vm.box_version = "<= 20160127.0.0"

    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.host_name = 'saltminion2.local'
    minion_config.vm.network "private_network", ip: "192.168.51.12"
    #minion_config.vm.network "public_network", ip: "192.168.50.12"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "etc/minion2"
      salt.minion_key = "etc/certs/minion2.pem"
      salt.minion_pub = "etc/certs/minion2.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion3 do |minion_config|
    minion_config.landrush.enabled = true
    minion_config.vm.box = "ubuntu/trusty64"
    #minion_config.vm.box_version = "<= 20160127.0.0"

    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.host_name = 'saltminion2.local'
    minion_config.vm.network "private_network", ip: "192.168.51.12"
    #minion_config.vm.network "public_network", ip: "192.168.50.12"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "etc/minion3"
      salt.minion_key = "etc/certs/minion3.pem"
      salt.minion_pub = "etc/certs/minion3.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

end
