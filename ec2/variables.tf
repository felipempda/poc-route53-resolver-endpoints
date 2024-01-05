variable "public_key_path" {
  description = "Path to public key to be used with EC2 instance"
  default     = "~/.ssh/id_rsa.pub"
}

variable "subnet_id" {
  description = "Subnet where to deploy EC2"
}

variable "vpc_id" {
  description = "Subnet where to create Security Group"
}

variable "name" {
  description = "Tag Name of ec2 instance"
  default     = "ec2-instance"
}
