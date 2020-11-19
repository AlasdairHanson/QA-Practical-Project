provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "my_vpc" {
  source = "./VPC"
}

module "my_ec2" {
  source      = "./EC2"
  vpc_id      = module.my_vpc.vpcid
  subnet_a_id = module.my_vpc.public_subnetid
}

resource "aws_security_group" "rds_sg" {
  name   = "rds_sg"
  vpc_id = module.my_vpc.vpcid

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.open_internet]
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  subnet_ids = [module.my_vpc.public_subnetid, module.my_vpc.private_subnetid]
}

resource "aws_db_instance" "testdb" {
  name                   = "testdb"
  instance_class         = var.ec2_instance_type
  engine                 = var.ec2_engine
  engine_version         = var.ec2_engine_version
  allocated_storage      = var.ec2_storage_size
  storage_type           = var.ec2_storage_type
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.id
  skip_final_snapshot = true
}

resource "aws_db_instance" "k8sdb" {
  name                   = "k8sdb"
  instance_class         = var.ec2_instance_type
  engine                 = var.ec2_engine
  engine_version         = var.ec2_engine_version
  allocated_storage      = var.ec2_storage_size
  storage_type           = var.ec2_storage_type
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.id
  skip_final_snapshot = true
}

resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    command = "ansible-playbook -i $(terraform output ec2_ip),  playbook.yaml"
  }
}
