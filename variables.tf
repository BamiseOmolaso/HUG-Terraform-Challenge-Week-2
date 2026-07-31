variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used as a prefix/tag on resources"
  type        = string
  default     = "hug-terraform-challenge"
}

variable "full_name" {
  description = "Name shown on the Nginx landing page"
  type        = string
  default     = "Dr. Oluwabamise Omolaso"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair in this region (for SSH)"
  type        = string
  default     = "terraform-key"
}
