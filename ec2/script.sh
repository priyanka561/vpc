#!/bin/bash
sudo yum update -y &&
wget https://packages.chef.io/files/stable/chefdk/1.1.16/ubuntu/16.04/chefdk_1.1.16-1_amd64.deb  &&
dpkg -i chefdk_1.1.16-1_amd64.deb &&
mkdir /etc/chef &&
	mkdir /tmp/cookbooks &&
	echo 'cookbook_path "/tmp/cookbooks"' > /etc/chef/solo.rb &&
git clone https://github.com/priyanka561/jenkins.git /tmp/cookbooks/chef-dnow &&
cat <<EOF > /etc/chef/attr.json &&
{
	"run_list" : [
		"recipe[jenkins]"
	]
}
EOF
	chef-solo -j /etc/chef/attr.json 
