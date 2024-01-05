resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public-subnet-a" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subneta_cidr
  tags = {
    Name = "public-subnet-a"
  }
  availability_zone = var.subneta_az
}

resource "aws_subnet" "public-subnet-b" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnetb_cidr
  tags = {
    Name = "public-subnet-b"
  }
  availability_zone = var.subnetb_az
}

resource "aws_subnet" "private-subnet-a" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subneta_cidr
  tags = {
    Name = "private-subnet-a"
  }
  availability_zone = var.subneta_az
}

resource "aws_subnet" "private-subnet-b" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnetb_cidr
  tags = {
    Name = "private-subnet-b"
  }
  availability_zone = var.subnetb_az
}

resource "aws_route_table_association" "public-subneta" {
  subnet_id      = aws_subnet.public-subnet-a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-subnetb" {
  subnet_id      = aws_subnet.public-subnet-b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-subneta" {
  subnet_id      = aws_subnet.private-subnet-a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-subnetb" {
  subnet_id      = aws_subnet.private-subnet-b.id
  route_table_id = aws_route_table.private.id
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
}


resource "aws_route" "route-public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}
