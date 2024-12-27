data "aws_vpc" "default" {
  default = true
}

#Default VPC
data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#Create a Load balanacer
resource "aws_lb" "swat-grafana-alb" {
  name               = "Swat-Grafana-ALb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id] 
  subnets            = data.aws_subnets.default_vpc_subnets.ids

  tags = var.tags
}

#Create nginx Target Group and attach
resource "aws_lb_target_group" "nginx-tg" {
  name        = "nginx-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id = data.aws_vpc.default.id
}

#Create nginx Listener
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.swat-grafana-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx-tg.arn
  }
}