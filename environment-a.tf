
// Environment A

// VPC and Subnets
module "vpc-a" {
  source         = "./vpc"
  vpc_cidr_block = local.vpca_cidr
  subneta_az     = local.aza
  subnetb_az     = local.azb
  subneta_cidr   = local.vpca_subneta_cidr
  subnetb_cidr   = local.vpca_subnetb_cidr
}

// EC2 instance
module "ec2-a" {
  source          = "./ec2"
  vpc_id          = module.vpc-a.vpc_id
  subnet_id       = module.vpc-a.subneta_id
  public_key_path = "~/.ssh/id_rsa.pub"
  name            = "instance-a"
}

// Private Hosted Zone
resource "aws_route53_zone" "dns_zone_private" {
  vpc {
    vpc_id     = module.vpc-a.vpc_id
    vpc_region = local.region
  }
  name = local.private_domain
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
    subnet_id = module.vpc-a.subneta_id
    ip        = local.vpca_inbound_resolver_ipa
  }
  ip_address {
    subnet_id = module.vpc-a.subnetb_id
    ip        = local.vpca_inbound_resolver_ipb
  }
}

output "vpca-instance-public-dns" {
  value = module.ec2-a.public_dns
}

output "vpca-inbound-resolver-ipA" {
  value = local.vpca_inbound_resolver_ipa
}

output "vpca-inbound-resolver-ipB" {
  value = local.vpca_inbound_resolver_ipb
}
