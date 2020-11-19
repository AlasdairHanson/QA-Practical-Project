resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr-block
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_sn" {
  cidr_block        = var.pub-subnet-cidr-block
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "private_sn" {
  cidr_block        = var.private-subnet-cidr-block
  availability_zone = data.aws_availability_zones.available.names[1]
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "vpc_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }
}

resource "aws_route_table_association" "pub_sn_rta" {
  subnet_id      = aws_subnet.public_sn.id
  route_table_id = aws_route_table.vpc_rt.id
}