variable "vpc_id" {
  description = "ID of the VPC to attach networking resources to"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "project_name" {
  description = "Short name used as a prefix/tag on resources"
  type        = string
}
