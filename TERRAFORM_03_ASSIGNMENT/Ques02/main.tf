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

resource "aws_ami_from_instance" "ami_instance" {
  name               = "Terra-First-us-east-1b"
  source_instance_id = "i-029d377cabc35aaec"
}

