# HUG Lagos/Ibadan Terraform Challenge - Week Two

Week One's flat Terraform config refactored into reusable modules, with state stored remotely in S3.

Same result as Week One: a public Nginx page showing my name and the challenge title.

## Modules

| Module | Creates |
|--------|---------|
| `modules/vpc` | VPC (`10.0.0.0/16`) |
| `modules/networking` | Public subnet (`10.0.1.0/24`), internet gateway, route table, route, association |
| `modules/security_groups` | Security group: SSH (22) and HTTP (80) in, all out |
| `modules/compute` | Amazon Linux 2023 AMI lookup, `t3.micro` EC2, Nginx `user_data` |

The root module wires them together and outputs the public IP, DNS, instance ID and website URL.

## Prerequisites

- Terraform `>= 1.14.0`
- AWS credentials configured (`aws sts get-caller-identity` should work)
- An EC2 key pair in `us-east-1` (default name `terraform-key`), for SSH

## Deploy

```bash
cp terraform.tfvars.example terraform.tfvars   # then edit your name and key_name
terraform init
terraform plan
terraform apply
terraform output website_url
```

Open the URL. Give it a minute after apply; `user_data` still has to install Nginx on first boot.

`terraform.tfvars` is gitignored.

## SSH

```bash
ssh -i ~/.ssh/terraform-key.pem ec2-user@$(terraform output -raw public_ip)
```

Never commit `.pem` files.

## Notes

`user_data` runs only on first boot, so editing it does nothing to a running instance. The compute module sets `user_data_replace_on_change = true`, which tells Terraform to replace the instance when the script changes. The public IP changes with it.

## Screenshots

### Webpage

![Webpage](screenshots/webpage.png)

### EC2 instance running

![EC2 console](screenshots/ec2-console.png)

## Cleanup

```bash
terraform destroy
```

This removes the 11 resources in the stack. The S3 state bucket is not part of the stack and is not destroyed; delete it manually if you no longer need it.

## Deliverables

- Modular Terraform code (this repo)
- Remote backend (S3 with `use_lockfile`)
- Deployment instructions (this file)
- Screenshots of the webpage and the running instance
- LinkedIn post tagging HUG Lagos and HUG Ibadan
