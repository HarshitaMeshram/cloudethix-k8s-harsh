terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "web" {
  ami           = var.EC2_AMI
  instance_type = var.EC2_TYPE

  tags = {
    Name = "Terra-First"
  }
}

resource "aws_subnet" "this_pub_01" {
  vpc_id     = aws_vpc.this_main_vpc.id
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "this_pub_01"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.PUB_NME
  public_key = var.PUB_KEY 
  }

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = var.DSCRIP
  tags = {
    Name = "new_tls"
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.VALUE

  }

    egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.VALUE

  }
}



