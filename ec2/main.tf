provider "aws" {
  region = "us-east-1"
 }
resource "aws_instance" "ec2-terraform" {
  ami = "ami-55ef662f"
  instance_type = "t2.micro"
  vpc_id = "${var.vpc-terraform.id}"
  subnet_id = "${var.public_subnet.id}"
  associate_public_ip_address = "true"
    vpc_security_group_ids = ["${aws_security_group.security-terraform.id}"]
   tags {
         Name = "ec2"
  }
 }
