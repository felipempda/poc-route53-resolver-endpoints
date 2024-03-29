
// Environment A

// VPC and Subnets
module "vpc-a" {
  source               = "./vpc"
  vpc_cidr_block       = var.vpca_cidr
  subneta_az           = var.aza
  subnetb_az           = var.azb
  public_subneta_cidr  = var.vpca_public_subneta_cidr
  public_subnetb_cidr  = var.vpca_public_subnetb_cidr
  private_subneta_cidr = var.vpca_private_subneta_cidr
  private_subnetb_cidr = var.vpca_private_subnetb_cidr
}

// EC2 instance
module "ec2-a" {
  source          = "./ec2"
  vpc_id          = module.vpc-a.vpc_id
  subnet_id       = module.vpc-a.public_subneta_id
  public_key_path = "~/.ssh/id_rsa.pub"
  name            = "instance-a"
}

// Private Hosted Zone
resource "aws_route53_zone" "dns_zone_private" {
  vpc {
    vpc_id     = module.vpc-a.vpc_id
    vpc_region = var.region
  }
  name = var.private_domain
}

resource "aws_route53_record" "google" {
  zone_id = aws_route53_zone.dns_zone_private.id
  type    = "CNAME"
  name    = "google"
  ttl     = 60
  records = ["www.google.com"]
}

// Inbound Resolver
resource "aws_security_group" "inbound" {
  name_prefix = "environmenta-resolver-inbound"
  vpc_id      = module.vpc-a.vpc_id
  ingress {
    description = "Inbound from anywhere 53 udp"
    from_port   = 53
    to_port     = 53
    protocol    = "udp" // DNS protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_resolver_endpoint" "inbound" {
  name               = "environment-a-inbound"
  direction          = "INBOUND"
  security_group_ids = [aws_security_group.inbound.id]

  ip_address {
    subnet_id = module.vpc-a.private_subneta_id
    ip        = var.vpca_inbound_resolver_ipa
  }
  ip_address {
    subnet_id = module.vpc-a.private_subnetb_id
    ip        = var.vpca_inbound_resolver_ipb
  }
}

output "vpca-instance-public-dns" {
  value       = module.ec2-a.public_dns
  description = "Public DNS of instance-a"
}

output "vpca-inbound-resolver-ipA" {
  value       = var.vpca_inbound_resolver_ipa
  description = "IP of inbound-resolver on VPCA-A private subnet A"
}

output "vpca-inbound-resolver-ipB" {
  value       = var.vpca_inbound_resolver_ipb
  description = "IP of inbound-resolver on VPCA-A private subnet B"
}
