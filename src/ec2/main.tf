
resource "aws_key_pair" "this" {
  key_name_prefix = "my-key"
  public_key      = file(var.public_key_path)
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "this" {
  name_prefix = "ec2-security-group"
  description = "EC2 security group"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ssh-ingress" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  description       = "SSH from my PC"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
}

resource "aws_security_group_rule" "icmp-ingress" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  description       = "ICMP from anywhere"
  from_port         = -1
  to_port           = -1
  protocol          = "ICMP"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "all-egress" {
  security_group_id = aws_security_group.this.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  key_name                    = aws_key_pair.this.key_name
  vpc_security_group_ids      = [aws_security_group.this.id]

  tags = {
    Name = var.name
  }
}
