output "vpc_id"{
  value = "${aws_vpc.vpc-terraform.id}"
}
output "Pubsubnet_id"{
  value = "${aws_subnet.public_subnet.id}"
}
