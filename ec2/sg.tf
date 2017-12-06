resource "aws_security_group" "security-tf" {
   name = "security-tf"
   tags {
         Name = "security-tf"
   }
   description = "ONLY HTTP CONNECTION INBOUD"
   vpc_id      = "${var.vpc_tf_id}"
   ingress {
        from_port = 80
         to_port = 80
         protocol = "TCP"
         cidr_blocks = ["202.65.158.154/32"]
   }
   ingress {
        from_port = 80
         to_port = 80
         protocol = "TCP"
         cidr_blocks = ["10.0.0.0/16"]
   }
   ingress {
     from_port   = "22"
     to_port     = "22"
    protocol    = "TCP"
     cidr_blocks = ["202.65.158.154/32"]
   }
   ingress {
     from_port   = "80"
     to_port     = "80"
    protocol    = "TCP"
     cidr_blocks = ["54.161.67.14/32"]
   }
   egress {
    from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["202.65.158.154/32"]
   }
 }
