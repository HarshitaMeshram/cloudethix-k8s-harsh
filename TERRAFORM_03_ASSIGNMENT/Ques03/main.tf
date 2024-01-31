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

data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = ["112365962865"]

    filter {
        name   = "name"
        values = ["Terra-First-us-east-1b"]
    }

   filter {
        name   = "virtualization-type"
        values = ["hvm"]
  }
}

resource "aws_instance" "ubuntu" {

  instance_type = var.EC2_TYPE
  ami = data.aws_ami.ubuntu.id

  tags = {
    Name = "aws_instance"
  }
}

