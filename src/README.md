# Documentation - solution

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-a"></a> [ec2-a](#module\_ec2-a) | ./ec2 | n/a |
| <a name="module_ec2-b"></a> [ec2-b](#module\_ec2-b) | ./ec2 | n/a |
| <a name="module_vpc-a"></a> [vpc-a](#module\_vpc-a) | ./vpc | n/a |
| <a name="module_vpc-b"></a> [vpc-b](#module\_vpc-b) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route.traffic-from-a-to-b-private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route) | resource |
| [aws_route.traffic-from-a-to-b-public](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route) | resource |
| [aws_route.traffic-from-b-to-a-private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route) | resource |
| [aws_route.traffic-from-b-to-a-public](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route) | resource |
| [aws_route53_record.google](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_record) | resource |
| [aws_route53_resolver_endpoint.inbound](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_resolver_endpoint) | resource |
| [aws_route53_resolver_endpoint.outbound](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_resolver_endpoint) | resource |
| [aws_route53_resolver_rule.from-b-to-a](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_resolver_rule) | resource |
| [aws_route53_resolver_rule_association.this](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_resolver_rule_association) | resource |
| [aws_route53_zone.dns_zone_private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route53_zone) | resource |
| [aws_security_group.inbound](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/security_group) | resource |
| [aws_security_group.outbound](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/security_group) | resource |
| [aws_vpc_peering_connection.peer](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc_peering_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aza"></a> [aza](#input\_aza) | Availability Zone for subnets A | `string` | `"ca-central-1a"` | no |
| <a name="input_azb"></a> [azb](#input\_azb) | Availability Zone for subnets B | `string` | `"ca-central-1b"` | no |
| <a name="input_private_domain"></a> [private\_domain](#input\_private\_domain) | Private Hosted Zone Name to be deployed on VPC-A | `string` | `"environment-a.private.com"` | no |
| <a name="input_public_key_path"></a> [public\_key\_path](#input\_public\_key\_path) | Path to public key to be used with EC2 instance | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where to deploy code | `string` | `"ca-central-1"` | no |
| <a name="input_use_output_endpoint"></a> [use\_output\_endpoint](#input\_use\_output\_endpoint) | Create outbound endpoint on environment B? | `bool` | `true` | no |
| <a name="input_vpca_cidr"></a> [vpca\_cidr](#input\_vpca\_cidr) | CIDR Block of VPC-A | `string` | `"10.78.0.0/16"` | no |
| <a name="input_vpca_inbound_resolver_ipa"></a> [vpca\_inbound\_resolver\_ipa](#input\_vpca\_inbound\_resolver\_ipa) | IP of inbound resolver on VPC-A private subnet A | `string` | `"10.78.100.10"` | no |
| <a name="input_vpca_inbound_resolver_ipb"></a> [vpca\_inbound\_resolver\_ipb](#input\_vpca\_inbound\_resolver\_ipb) | IP of inbound resolver on VPC-A private subnet B | `string` | `"10.78.101.10"` | no |
| <a name="input_vpca_private_subneta_cidr"></a> [vpca\_private\_subneta\_cidr](#input\_vpca\_private\_subneta\_cidr) | CIDR Block of VPC-A private subnet A | `string` | `"10.78.100.0/24"` | no |
| <a name="input_vpca_private_subnetb_cidr"></a> [vpca\_private\_subnetb\_cidr](#input\_vpca\_private\_subnetb\_cidr) | CIDR Block of VPC-A private subnet B | `string` | `"10.78.101.0/24"` | no |
| <a name="input_vpca_public_subneta_cidr"></a> [vpca\_public\_subneta\_cidr](#input\_vpca\_public\_subneta\_cidr) | CIDR Block of VPC-A public subnet A | `string` | `"10.78.0.0/24"` | no |
| <a name="input_vpca_public_subnetb_cidr"></a> [vpca\_public\_subnetb\_cidr](#input\_vpca\_public\_subnetb\_cidr) | CIDR Block of VPC-A public subnet B | `string` | `"10.78.1.0/24"` | no |
| <a name="input_vpcb_cidr"></a> [vpcb\_cidr](#input\_vpcb\_cidr) | CIDR Block of VPC-B | `string` | `"10.99.0.0/16"` | no |
| <a name="input_vpcb_outbound_resolver_ipa"></a> [vpcb\_outbound\_resolver\_ipa](#input\_vpcb\_outbound\_resolver\_ipa) | IP of outbound resolver on VPC-B private subnet A | `string` | `"10.99.100.10"` | no |
| <a name="input_vpcb_outbound_resolver_ipb"></a> [vpcb\_outbound\_resolver\_ipb](#input\_vpcb\_outbound\_resolver\_ipb) | IP of outbound resolver on VPC-B private subnet B | `string` | `"10.99.101.10"` | no |
| <a name="input_vpcb_private_subneta_cidr"></a> [vpcb\_private\_subneta\_cidr](#input\_vpcb\_private\_subneta\_cidr) | CIDR Block of VPC-B private subnet A | `string` | `"10.99.100.0/24"` | no |
| <a name="input_vpcb_private_subnetb_cidr"></a> [vpcb\_private\_subnetb\_cidr](#input\_vpcb\_private\_subnetb\_cidr) | CIDR Block of VPC-B private subnet B | `string` | `"10.99.101.0/24"` | no |
| <a name="input_vpcb_public_subneta_cidr"></a> [vpcb\_public\_subneta\_cidr](#input\_vpcb\_public\_subneta\_cidr) | CIDR Block of VPC-B public subnet A | `string` | `"10.99.0.0/24"` | no |
| <a name="input_vpcb_public_subnetb_cidr"></a> [vpcb\_public\_subnetb\_cidr](#input\_vpcb\_public\_subnetb\_cidr) | CIDR Block of VPC-B public subnet B | `string` | `"10.99.1.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpca-inbound-resolver-ipA"></a> [vpca-inbound-resolver-ipA](#output\_vpca-inbound-resolver-ipA) | IP of inbound-resolver on VPCA-A private subnet A |
| <a name="output_vpca-inbound-resolver-ipB"></a> [vpca-inbound-resolver-ipB](#output\_vpca-inbound-resolver-ipB) | IP of inbound-resolver on VPCA-A private subnet B |
| <a name="output_vpca-instance-public-dns"></a> [vpca-instance-public-dns](#output\_vpca-instance-public-dns) | Public DNS of instance-a |
| <a name="output_vpcb-instance-public-dns"></a> [vpcb-instance-public-dns](#output\_vpcb-instance-public-dns) | Public DNS of instance-b |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
