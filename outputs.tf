output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.compute.public_ip
}

output "public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = module.compute.public_dns
}

output "instance_id" {
  description = "The instance ID of the EC2 instance"
  value       = module.compute.instance_id
}

output "website_url" {
  description = "The website URL of the EC2 instance"
  value       = module.compute.website_url
}
