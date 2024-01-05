variable "use_output_endpoint" {
  description = "Create outbound endpoint on environment B?"
  default     = true
}

variable "region" {
  description = "Region where to deploy code"
  default     = "ca-central-1"
}

variable "aza" {
  description = "Availability Zone for subnets A"
  default     = "ca-central-1a"
}

variable "azb" {
  description = "Availability Zone for subnets B"
  default     = "ca-central-1b"
}

variable "vpca_cidr" {
  description = "CIDR Block of VPC-A"
  default     = "10.78.0.0/16"
}

variable "vpca_public_subneta_cidr" {
  description = "CIDR Block of VPC-A public subnet A"
  default     = "10.78.0.0/24"
}

variable "vpca_public_subnetb_cidr" {
  description = "CIDR Block of VPC-A public subnet B"
  default     = "10.78.1.0/24"
}

variable "vpca_private_subneta_cidr" {
  description = "CIDR Block of VPC-A private subnet A"
  default     = "10.78.100.0/24"
}

variable "vpca_private_subnetb_cidr" {
  description = "CIDR Block of VPC-A private subnet B"
  default     = "10.78.101.0/24"
}

variable "vpca_inbound_resolver_ipa" {
  description = "IP of inbound resolver on VPC-A private subnet A"
  default     = "10.78.100.10"
}

variable "vpca_inbound_resolver_ipb" {
  description = "IP of inbound resolver on VPC-A private subnet B"
  default     = "10.78.101.10"
}


variable "vpcb_cidr" {
  description = "CIDR Block of VPC-B"
  default     = "10.99.0.0/16"
}

variable "vpcb_public_subneta_cidr" {
  description = "CIDR Block of VPC-B public subnet A"
  default     = "10.99.0.0/24"
}

variable "vpcb_public_subnetb_cidr" {
  description = "CIDR Block of VPC-B public subnet B"
  default     = "10.99.1.0/24"
}

variable "vpcb_private_subneta_cidr" {
  description = "CIDR Block of VPC-B private subnet A"
  default     = "10.99.100.0/24"
}

variable "vpcb_private_subnetb_cidr" {
  description = "CIDR Block of VPC-B private subnet B"
  default     = "10.99.101.0/24"
}

variable "vpcb_outbound_resolver_ipa" {
  description = "IP of outbound resolver on VPC-B private subnet A"
  default     = "10.99.100.10"
}

variable "vpcb_outbound_resolver_ipb" {
  description = "IP of outbound resolver on VPC-B private subnet B"
  default     = "10.99.101.10"
}

variable "public_key_path" {
  description = "Path to public key to be used with EC2 instance"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_domain" {
  description = "Private Hosted Zone Name to be deployed on VPC-A"
  default     = "environment-a.private.com"
}
