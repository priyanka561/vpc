#!/bin/bash
sudo yum update -y &&
wget https://packages.chef.io/files/stable/chefdk/1.1.16/ubuntu/16.04/chefdk_1.1.16-1_amd64.deb  &&
dpkg -i chefdk_1.1.16-1_amd64.deb &&
git clone https://github.com/priyanka561/jenkins.git
{
	"run_list" : [
		"recipe[jenkins]"
	]
}
sudo chef-client --local-mode --runlist 'recipe[jenkins]'

