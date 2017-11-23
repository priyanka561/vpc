output "vpc_id"{
  value = "${aws_vpc.vpc-terraform.id}"
}
output "Pubsubnet_id"{
  value = "${aws_subnet.public_subnet.id}"
}
output "ec2"{
  value = "${aws_instance.ec2-terraform.id}"
}
