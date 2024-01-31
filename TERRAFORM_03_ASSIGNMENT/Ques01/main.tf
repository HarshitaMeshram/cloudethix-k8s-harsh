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

resource "aws_instance" "web" {
  ami           = var.EC2_AMI
  instance_type = var.EC2_TYPE

  tags = {
    Name = "Terra-First"
  }
}

