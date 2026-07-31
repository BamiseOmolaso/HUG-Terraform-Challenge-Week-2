# Remote state in S3 with native locking (Terraform >= 1.10).
# Bucket created out-of-band (versioning on, block public access, SSE-S3).
# Docs: https://developer.hashicorp.com/terraform/language/settings/backends/s3
terraform {
  backend "s3" {
    bucket       = "hug-tf-state-827327671360"
    key          = "hug-week-2/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
