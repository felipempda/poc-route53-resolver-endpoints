# Documentation - module vpc

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.route-public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private-subneta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private-subnetb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-subneta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-subnetb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private-subnet-a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private-subnet-b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_subneta_cidr"></a> [private\_subneta\_cidr](#input\_private\_subneta\_cidr) | CIDR Block of Private Subnet A | `any` | n/a | yes |
| <a name="input_private_subnetb_cidr"></a> [private\_subnetb\_cidr](#input\_private\_subnetb\_cidr) | CIDR Block of Private Subnet B | `any` | n/a | yes |
| <a name="input_public_subneta_cidr"></a> [public\_subneta\_cidr](#input\_public\_subneta\_cidr) | CIDR Block of Public Subnet A | `any` | n/a | yes |
| <a name="input_public_subnetb_cidr"></a> [public\_subnetb\_cidr](#input\_public\_subnetb\_cidr) | CIDR Block of Public Subnet B | `any` | n/a | yes |
| <a name="input_subneta_az"></a> [subneta\_az](#input\_subneta\_az) | Availability Zone of subnet A | `any` | n/a | yes |
| <a name="input_subnetb_az"></a> [subnetb\_az](#input\_subnetb\_az) | Availability Zone of subnet B | `any` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR Block of VPC | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | ID of Private Route Table |
| <a name="output_private_subneta_id"></a> [private\_subneta\_id](#output\_private\_subneta\_id) | ID of Private Subnet A |
| <a name="output_private_subnetb_id"></a> [private\_subnetb\_id](#output\_private\_subnetb\_id) | ID of Private Subnet B |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | ID of Public Route Table |
| <a name="output_public_subneta_id"></a> [public\_subneta\_id](#output\_public\_subneta\_id) | ID of Public Subnet A |
| <a name="output_public_subnetb_id"></a> [public\_subnetb\_id](#output\_public\_subnetb\_id) | ID of Public Subnet B |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
