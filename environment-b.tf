// Enviroment B

// VPC and Subnets
module "vpc-b" {
  source               = "./vpc"
  vpc_cidr_block       = local.vpcb_cidr
  subneta_az           = local.aza
  subnetb_az           = local.azb
  public_subneta_cidr  = local.vpcb_public_subneta_cidr
  public_subnetb_cidr  = local.vpcb_public_subnetb_cidr
  private_subneta_cidr = local.vpcb_private_subneta_cidr
  private_subnetb_cidr = local.vpcb_private_subnetb_cidr
}

// EC2 instance
module "ec2-b" {
  source          = "./ec2"
  vpc_id          = module.vpc-b.vpc_id
  subnet_id       = module.vpc-b.public_subneta_id
  public_key_path = "~/.ssh/id_rsa.pub"
  name            = "instance-b"
}

// Outbound Resolver
resource "aws_security_group" "outbound" {
  name_prefix = "environmenta-resolver-outbound"
  vpc_id      = module.vpc-b.vpc_id
  ingress {
    description = "Inbound from anywhere 53 udp"
    from_port   = 53
    to_port     = 53
    protocol    = "udp" // DNS protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Egress to anywhere 53 udp"
    from_port   = 53
    to_port     = 53
    protocol    = "udp" // DNS protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_resolver_endpoint" "outbound" {
  count              = var.use_output_endpoint ? 1 : 0
  name               = "environment-a-outbound"
  direction          = "OUTBOUND"
  security_group_ids = [aws_security_group.outbound.id]

  ip_address {
    subnet_id = module.vpc-b.private_subneta_id
  }
  ip_address {
    subnet_id = module.vpc-b.private_subnetb_id
  }
}

output "vpcb-instance-public-dns" {
  value = module.ec2-b.public_dns
}

// Forward rule for Outbound resolver
resource "aws_route53_resolver_rule" "from-b-to-a" {
  count                = var.use_output_endpoint ? 1 : 0
  domain_name          = local.private_domain
  name                 = "Rule from B to A"
  rule_type            = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.outbound[0].id

  target_ip {
    ip = local.vpca_inbound_resolver_ipa
  }
  target_ip {
    ip = local.vpca_inbound_resolver_ipb
  }
}

// Forward rule Association with VPC-B
resource "aws_route53_resolver_rule_association" "this" {
  count            = var.use_output_endpoint ? 1 : 0
  resolver_rule_id = aws_route53_resolver_rule.from-b-to-a[0].id
  vpc_id           = module.vpc-b.vpc_id
}
