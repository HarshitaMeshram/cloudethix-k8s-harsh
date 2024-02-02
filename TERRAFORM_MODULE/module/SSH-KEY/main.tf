resource "aws_key_pair" "deployer" {
  key_name   = var.M-SSH-KEYNME
  public_key = var.M-PUB-KEY
  }