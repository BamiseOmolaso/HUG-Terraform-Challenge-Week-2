output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.ec2_instance.public_dns
}

output "instance_id" {
  description = "The instance ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "website_url" {
  description = "The website URL of the EC2 instance"
  value       = "http://${aws_instance.ec2_instance.public_ip}"
}
