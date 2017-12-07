provider "aws" {
  region = "us-east-1"
 }
data "template_file" "script" {
 template = "${file("${path.module}/template/script.sh.tpl")}"
}
resource "aws_instance" "ec2-terraform" {
  ami = "ami-55ef662f"
  instance_type = "t2.micro"
  key_name = "virgina-key-pair"
  subnet_id = "${var.public_subnet_id}"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["${aws_security_group.s-grp.id}"]
  user_data = "${data.template_file.script.rendered}"
   tags {
         Name = "ec2"
         Owner = "priyanka.elluri"
         Environment = "Testing"
         Project = "Reancloud"
         ExpirationDate = "2017-12-30"
  }
 }
