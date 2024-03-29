// VPC Peering
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id = module.vpc-b.vpc_id
  vpc_id      = module.vpc-a.vpc_id
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = false # to simulate two separate environments
  }

  requester {
    allow_remote_vpc_dns_resolution = false # to simulate two separate environments
  }
}


// Routes for communication between VPCs
resource "aws_route" "traffic-from-a-to-b-public" {
  route_table_id            = module.vpc-a.public_route_table_id
  destination_cidr_block    = var.vpcb_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "traffic-from-a-to-b-private" {
  route_table_id            = module.vpc-a.private_route_table_id
  destination_cidr_block    = var.vpcb_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "traffic-from-b-to-a-public" {
  route_table_id            = module.vpc-b.public_route_table_id
  destination_cidr_block    = var.vpca_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "traffic-from-b-to-a-private" {
  route_table_id            = module.vpc-b.private_route_table_id
  destination_cidr_block    = var.vpca_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
