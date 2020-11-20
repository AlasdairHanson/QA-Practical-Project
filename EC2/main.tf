resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.open_internet]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.open_internet]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.open_internet]
  }
}

resource "aws_key_pair" "demo_key" {
  key_name   = "demo_key"
  public_key = var.public_key
}

resource "aws_instance" "jenkins_ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = aws_key_pair.demo_key.key_name
  associate_public_ip_address = true
  subnet_id                   = var.subnet_a_id 
  vpc_security_group_ids     = [aws_security_group.web_sg.id]
}

resource "aws_instance" "pytest_ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = aws_key_pair.demo_key.key_name
  associate_public_ip_address = true
  subnet_id                   = var.subnet_a_id 
  vpc_security_group_ids     = [aws_security_group.web_sg.id]
}