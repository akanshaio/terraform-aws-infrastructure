output "instance_id" {
  value = aws_instance.web_server.id
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "public_dns" {
  value = aws_instance.web_server.public_dns
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.web_asg.name
}