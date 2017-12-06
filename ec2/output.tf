output "ec2"{
  value = "${aws_instance.ec2-terraform.id}"
 }
output "public_ip"{
  value = "${aws_instance.associate_public_ip_address.id}"
  }
