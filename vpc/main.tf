resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet-a" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.subneta_cidr
  tags = {
    Name = "subnet-a"
  }
  availability_zone = var.subneta_az
}

resource "aws_subnet" "subnet-b" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.subnetb_cidr
  tags = {
    Name = "subnet-b"
  }
  availability_zone = var.subnetb_az
}

resource "aws_route_table_association" "subneta" {
  subnet_id      = aws_subnet.subnet-a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "subnetb" {
  subnet_id      = aws_subnet.subnet-b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "this" {
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
