output "lb_dns" {
  value = aws_lb.swat-grafana-alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.nginx-tg.arn
}