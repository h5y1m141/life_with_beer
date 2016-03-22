# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = 'bento/centos-7.1'
  config.vm.synced_folder '.', '/vagrant', type: 'nfs'
  config.vm.network :private_network, ip: '192.168.33.37'
  config.vm.network :forwarded_port, guest: 22, host: 12222, id: 'ssh'
  config.ssh.guest_port = 12222
  config.ssh.forward_agent = true
  config.vm.provision 'ansible_local' do |ansible|
    ansible.playbook = 'provision/vagrant.yml'
    ansible.groups = {
      'vagrant' => ['default']
    }
    ansible.verbose  = true
    ansible.install  = true
  end
end
