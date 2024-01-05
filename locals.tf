
locals {
  region = "ca-central-1" // please adapt
  aza    = "ca-central-1a"
  azb    = "ca-central-1b"

  vpca_cidr                 = "10.78.0.0/16"
  vpca_subneta_cidr         = "10.78.0.0/24"
  vpca_subnetb_cidr         = "10.78.1.0/24"
  vpca_inbound_resolver_ipa = "10.78.0.10"
  vpca_inbound_resolver_ipb = "10.78.1.10"

  vpcb_cidr                  = "10.99.0.0/16"
  vpcb_subneta_cidr          = "10.99.100.0/24"
  vpcb_subnetb_cidr          = "10.99.101.0/24"
  vpcb_outbound_resolver_ipa = "10.99.100.10"
  vpcb_outbound_resolver_ipb = "10.99.101.10"

  public_key_path = "~/.ssh/id_rsa.pub"
  private_domain  = "environment-a.private.com"
}
