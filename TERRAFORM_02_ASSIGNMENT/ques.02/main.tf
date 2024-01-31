terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "this" {
  ami                     = var.AMI_IMG
  instance_type           = "t2.micro"
}

resource "aws_eip" "lb" {
  instance = aws_instance.this.id
  domain   = "vpc"
}

output "public_dns" {
  value = aws_instance.this.public_dns
}

output "private_dns" {
  value = aws_instance.this.private_dns
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

