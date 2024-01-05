
provider "aws" {
  region = local.region

  default_tags {
    tags = {
      Environment = "Test"
      Project     = "POC Route53 Resolver Endpoints"
    }
  }
}
