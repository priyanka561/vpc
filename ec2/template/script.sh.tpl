#!/bin/bash
sudo yum update -y &&
sudo yum install git &&
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 2.0.28  &&
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
