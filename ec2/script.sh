#!/bin/bash
sudo yum update -y
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 2.0.28
mkdir chef-repo
cd chef-repo
mkdir cookbooks
cd cookbooks
chef generate cookbook httpd
