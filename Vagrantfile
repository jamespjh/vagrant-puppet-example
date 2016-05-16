Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.box_version = "1.0.0"
  config.vm.host_name = 'testws.ucl.ac.uk'

  config.vm.provision :shell do |shell|
    shell.inline = "mkdir -p /etc/puppet/modules;
                    puppet module install puppetlabs/apache;
                    puppet module install puppetlabs/firewall;
                    puppet module install stahnma/epel"
  end
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.provision "puppet"
  config.vm.provision "file", source: "python", destination: "~"
  config.vm.provision :shell do |shell|
    shell.inline = "sudo cp -r python/* /var/www/service"
  end
  config.vm.network :forwarded_port, guest: 80, host: 8080
end
