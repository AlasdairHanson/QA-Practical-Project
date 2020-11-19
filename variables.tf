variable "ec2_instance_type" {
  default = "db.t2.micro"
}

variable "ec2_engine" {
  default = "mysql"
}

variable "ec2_engine_version" {
  default = "5.7"
}

variable "ec2_storage_size" {
  default = 20
}

variable "ec2_storage_type" {
  default = "gp2"
}

variable "db_username" {

}

variable "db_password" {

}

variable "open_internet" {
  default = "0.0.0.0/0"
}