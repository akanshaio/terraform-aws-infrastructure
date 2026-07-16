resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    # TODO: Replace with your own public IP later
    cidr_blocks = ["206.84.225.129/32"]
  }

  ingress {

    description = "HTTP from ALB"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    security_groups = [
      aws_security_group.alb_sg.id
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-security-group"
  }
}