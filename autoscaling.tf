resource "aws_autoscaling_group" "web_asg" {

  name = "terraform-web-asg"

  desired_capacity = 1
  min_size         = 1
  max_size         = 2

  vpc_zone_identifier = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  launch_template {

    id      = aws_launch_template.web_template.id
    version = "$Latest"

  }

  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]

  health_check_type = "ELB"

  health_check_grace_period = 120

  tag {

    key                 = "Name"
    value               = "ASG-Web-Server"
    propagate_at_launch = true

  }

}