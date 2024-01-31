terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "web" {
  ami           = var.EC2_AMI
  instance_type = var.EC2_TYPE
  key_name   = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "Terra-First"
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
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.VALUE

  }

    egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.VALUE

  }
}

