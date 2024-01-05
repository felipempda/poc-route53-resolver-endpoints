
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = "Test"
      Project     = "POC Route53 Resolver Endpoints"
    }
  }
}

terraform {
  required_version = ">= 1"

  required_providers {
    aws  = "5.31.0"
    http = "3.4.1"
  }
}
