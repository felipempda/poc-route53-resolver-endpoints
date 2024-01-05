output "vpc_id" {
  value = aws_vpc.this.id
}

output "subneta_id" {
  value = aws_subnet.subnet-a.id
}

output "subnetb_id" {
  value = aws_subnet.subnet-b.id
}

output "route_table_id" {
  value = aws_route_table.public.id
}
