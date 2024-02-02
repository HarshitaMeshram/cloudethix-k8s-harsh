module "EC2-INSTANCE" {
    source = "./module/EC2"
    M_AMI_ID = var.P_AMI_ID
    M_INST_TYPE = var.P_INST_TYPE
    M_SECURITY_GRP = [module.M_SECURITY_GROUP.SECURITY_NAME]
    M_SSH_KEY = module.SSH.PUB_KEY_ACCESS
}

module "M_SECURITY_GROUP" {
    source = "./module/SECURITY_GRP"
    M_CIDR = var.P_CIDR
    M_SECURITY_GROUP = var.P_SECURITY_GROUP
}

module "SSH" {
    source = "./module/SSH-KEY"
    M-SSH-KEYNME = var.P_SSH_KEYNAME 
    M-PUB-KEY = var.P_PUB_KEY
}

