variable "vpc_cidr_block" {
  description = "CIDR Block of VPC"
}

variable "subneta_az" {
  description = "Availability Zone of subnet A"
}

variable "subnetb_az" {
  description = "Availability Zone of subnet B"
}

variable "public_subneta_cidr" {
  description = "CIDR Block of Public Subnet A"
}

variable "private_subneta_cidr" {
  description = "CIDR Block of Private Subnet A"
}

variable "public_subnetb_cidr" {
  description = "CIDR Block of Public Subnet B"
}

variable "private_subnetb_cidr" {
  description = "CIDR Block of Private Subnet B"
}
