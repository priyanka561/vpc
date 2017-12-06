#!/bin/bash
sudo yum update -y
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 2.0.28
chef --version
