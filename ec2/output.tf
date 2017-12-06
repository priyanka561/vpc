output "ec2"{
  value = "${aws_instance.ec2-terraform.id}"
 }
output "public_ip"{
  value = ["${aws_instance.*.public_ip}"]
  }
output "private_ip"{
  value = ["${aws_instance.*.private_ip}"]
  }
