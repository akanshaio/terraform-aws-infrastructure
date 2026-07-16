resource "aws_instance" "web_server" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public_subnet_1.id

  vpc_security_group_ids = [

    aws_security_group.ec2_sg.id

  ]

  key_name = aws_key_pair.terraform_key.key_name

  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y nginx
systemctl enable nginx
systemctl start nginx

echo "<h1>Hello from Terraform - Akansha's DevOps Project</h1>" > /usr/share/nginx/html/index.html
EOF

  tags = {
    Name = "Terraform-Web-Server"
  }

}

