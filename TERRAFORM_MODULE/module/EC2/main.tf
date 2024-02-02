resource "aws_instance" "this" {
  ami                     = var.M_AMI_ID
  instance_type           = var.M_INST_TYPE
  key_name                = var.M_SSH_KEY
  security_groups         = var.M_SECURITY_GRP 
}

