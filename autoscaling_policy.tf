resource "aws_autoscaling_policy" "scale_out" {
  name                   = "terraform-scale-out"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = 1
  cooldown           = 300
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "terraform-scale-in"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = -1
  cooldown           = 300
}