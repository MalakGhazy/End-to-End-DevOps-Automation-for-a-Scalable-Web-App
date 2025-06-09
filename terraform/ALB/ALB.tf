resource "aws_lb" "app_alb" {
  name               = "nodejs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    Name = "nodejs-alb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = var.target_group_name
  port     = var.target_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check{
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200"
  }

  tags = {
    Name = "nodejs-tg"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = var.listener_port
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "app_targets" {
  for_each = var.instance_ids

  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = each.value
  port             = var.target_port
}