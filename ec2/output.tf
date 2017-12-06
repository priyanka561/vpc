output "ec2"{
  value = "${aws_instance.ec2-terraform.id}"
 }
output "public_ip"{
  value = "${aws_instance.ip.public_ip}"
  }
output "private_ip"{
  value = "${aws_instance.ip.private_ip}"
  }
