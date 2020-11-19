variable "ec2_ami" {
  default = "ami-0dc8d444ee2a42d8a"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMOw91vemHDuKtOiZSmXvNqZwPOSLp20dluB8fgsK2ppBmq5ZdQlLVCAZnvGDx85soUWLDW54UTvBHnssg6/OFamy8wK7oxPQryqhSE1/wZc3Jd673hJucyMnEai8fMBaRgyWJdB8sv+aEx3eMQYgIF/SGJctFsY1w5KpT6usGtSLxVFQSQ6MFHNKdSqyLA9DdiQUoSJA9ozXSvlqipWL9HrqvdedtxSBaD0j4LzRv1Xah6k+2zRz1RN+Dd9xcOF0ho0MOFr8mgVr+sdqwH+1Rbb3TD4CRQBQ30yakkqmFKqff9Pdl8rmfdTTw+FnRe9oBa2DbcXgUKRks7kAs1AdN ubuntu@ip-172-31-39-230"
}

variable "open_internet" {
  default = "0.0.0.0/0"
}

variable "subnet_a_id" {
  
}

variable "vpc_id" {
  
}