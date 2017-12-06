output "ec2"{
  value = "${aws_instance.ec2-terraform.id}"
 }
output "private_ip" { value = "${aws_instance.ec2_terraform.private_ip}" }
output "public_ip"  { value = "${aws_instance.ec2_terraform.public_ip}" }
