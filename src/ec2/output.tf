output "public_dns" {
  value       = aws_instance.this.public_dns
  description = "Public DNS of EC2 Instance"
}

output "instance_id" {
  value       = aws_instance.this.id
  description = "ID of EC2 Instance"
}
