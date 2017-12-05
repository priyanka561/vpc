provider "aws" {
  region = "us-east-1"
 }
resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "TestVPC"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.vpc-terraform.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
  	Name =  "Subnet az 1a"
  }
}
resource "aws_subnet" "private_1_subnet" {
  vpc_id                  = "${aws_vpc.vpc-terraform.id}"
  cidr_block              = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
  	Name =  "Subnet private 1 az 1a"
  }
}
 
resource "aws_subnet" "private_2_subnet" {
  vpc_id                  = "${aws_vpc.vpc-terraform.id}"
  cidr_block              = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
  	Name =  "Subnet private 2 az 1a"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc-terraform.id}"
  tags {
        Name = "InternetGateway"
    }
}
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.vpc-terraform.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}
resource "aws_eip" "eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.gw"]
}
resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.eip.id}"
    subnet_id = "${aws_subnet.public_subnet.id}"
    depends_on = ["aws_internet_gateway.gw"]
}
resource "aws_route_table" "private_route_table" {
    vpc_id = "${aws_vpc.vpc-terraform.id}"
 
    tags {
        Name = "Private route table"
    }
}
 
resource "aws_route" "private_route" {
	route_table_id  = "${aws_route_table.private_route_table.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.nat.id}"
}
resource "aws_route_table_association" "public_subnet_association" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_vpc.vpc-terraform.main_route_table_id}"
}
 
# Associate subnet private_1_subnet_eu_west_1a to private route table
resource "aws_route_table_association" "pr_1_subnet_association" {
    subnet_id = "${aws_subnet.private_1_subnet.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}
 
# Associate subnet private_2_subnet_eu_west_1a to private route table
resource "aws_route_table_association" "pr_2_subne_association" {
    subnet_id = "${aws_subnet.private_2_subnet.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}
