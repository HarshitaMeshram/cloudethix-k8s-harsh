resource "aws_security_group" "allow_tls" {
  name        = "SECURITY_GROUP"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "M_SECURITY_GROUP"
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.M_CIDR
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.M_CIDR
  }
}
