variable "P_AMI_ID" {
    type = string  
}

variable "P_INST_TYPE" {
    type = string  
}

variable "P_CIDR" {
    type = list(any)
}

variable "P_SECURITY_GROUP" {
    type = string  
}

variable "P_SSH_KEYNAME" {
    type = string
}

variable "P_PUB_KEY" { 
    type = string
}

