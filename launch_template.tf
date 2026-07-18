resource "aws_launch_template" "web_template" {

  name_prefix = "terraform-web-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  key_name = aws_key_pair.terraform_key.key_name

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = base64encode(<<-EOF
#!/bin/bash
dnf update -y
dnf install -y nginx
systemctl enable nginx
systemctl start nginx

echo "<h1>Hello from Auto Scaling Group</h1>" > /usr/share/nginx/html/index.html
EOF
  )

  tag_specifications {

    resource_type = "instance"

    tags = {

      Name = "ASG-Web-Server"

    }

  }

}