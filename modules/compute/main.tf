data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  tags = {
    Name = "${var.project_name}-web"
  }
  # user_data runs only on first boot, so changing the script alone has no
  # effect on a running instance. This flag tells Terraform to recreate the
  # instance whenever the script changes.
  # Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#user_data_replace_on_change
  user_data_replace_on_change = true

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y nginx

sudo cat > /usr/share/nginx/html/index.html <<EOT
<html>
  <body>
    <h1>${var.full_name}</h1>
    <p>HUG Lagos/Ibadan Terraform Challenge</p>
    <p>Week Two - Reusable Infrastructure with Modules</p>
  </body>
</html>
EOT

sudo systemctl start nginx
sudo systemctl enable nginx

EOF
}
