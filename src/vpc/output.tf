output "vpc_id" {
  value       = aws_vpc.this.id
  description = "ID of VPC"
}

output "public_subneta_id" {
  value       = aws_subnet.public-subnet-a.id
  description = "ID of Public Subnet A"
}

output "private_subnetb_id" {
  value       = aws_subnet.private-subnet-b.id
  description = "ID of Private Subnet B"
}

output "private_subneta_id" {
  value       = aws_subnet.private-subnet-a.id
  description = "ID of Private Subnet A"

}

output "public_subnetb_id" {
  value       = aws_subnet.public-subnet-b.id
  description = "ID of Public Subnet B"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "ID of Public Route Table"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "ID of Private Route Table"
}
