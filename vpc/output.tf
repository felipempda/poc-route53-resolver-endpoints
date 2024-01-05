output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subneta_id" {
  value = aws_subnet.public-subnet-a.id
}

output "private_subnetb_id" {
  value = aws_subnet.private-subnet-b.id
}

output "private_subneta_id" {
  value = aws_subnet.private-subnet-a.id
}

output "public_subnetb_id" {
  value = aws_subnet.public-subnet-b.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}
