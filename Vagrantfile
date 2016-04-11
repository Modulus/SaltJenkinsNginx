# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box = "ubuntu/trusty64"
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.20"
    master_config.vm.synced_folder "salt/", "/srv/salt"
    master_config.vm.synced_folder "pillar/", "/srv/pillar"
    master_config.vm.synced_folder "formulas/", "/srv/formulas"

    master_config.vm.provision :salt do |salt|
      salt.master_config = "etc/master"
      salt.master_key = "etc/keys/master_minion.key"
      salt.master_pub = "etc/keys/master_minion.crt"
      salt.minion_key = "etc/keys/master_minion.key"
      salt.minion_pub = "etc/keys/master_minion.crt"
      salt.seed_master = {
                          "minion1" => "etc/keys/minion1.crt",
                          "minion2" => "etc/keys/minion2.crt",
                          "minion3" => "etc/keys/minion3.crt"
                         }

      salt.install_type = "stable"
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-D -P -c  /tmp"
    end
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    minion_config.vm.host_name = 'saltminion1.local'
    minion_config.vm.network "private_network", ip: "192.168.50.21"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "etc/minion1"
      salt.minion_key = "etc/keys/minion1.key"
      salt.minion_pub = "etc/keys/minion1.crt"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-D -P -c /tmp"
    end
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.host_name = 'saltminion2.local'
    minion_config.vm.network "private_network", ip: "192.168.50.22"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "etc/minion2"
      #salt.grains_config = "etc/grains/haproxy"
      salt.minion_key = "etc/keys/minion2.key"
      salt.minion_pub = "etc/keys/minion2.crt"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-D -P -c /tmp"
    end
  end

  config.vm.define :minion3 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.host_name = 'saltminion3.local'
    minion_config.vm.network "private_network", ip: "192.168.50.23"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "etc/minion3"
      #salt.grains_config = "etc/grains/build"
      salt.minion_key = "etc/keys/minion2.key"
      salt.minion_pub = "etc/keys/minion2.crt"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-D -P -c /tmp"
    end
  end

end
