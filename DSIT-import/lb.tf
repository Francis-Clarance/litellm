resource "aws_lb" "dsit-llmlite-gateway-main-alb" {
  name               = "dsit-llmlite-gateway-main-alb"
  load_balancer_type = "application"
  internal           = false

  subnets = [
    aws_subnet.dsit-llmlite-gateway-main-public-eu-west-2a.id,
    aws_subnet.dsit-llmlite-gateway-main-public-eu-west-2b.id
  ]
}

resource "aws_lb_target_group" "dsit-litellm-tg-4000" {
  name        = "dsit-litellm-tg-4000"
  port        = 4000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.dsit-litellm-gateway-main.id
  target_type = "ip"

  health_check {
    path                = "/health/liveliness"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}