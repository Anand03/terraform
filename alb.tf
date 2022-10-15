resource "aws_lb" "main" {
  name               = "${var.environment}-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.default.id]
  subnets            = [for subnet in aws_subnet.public_subnet : subnet.id]

}

resource "aws_lb_target_group" "main" {
  name        = "${var.environment}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

/* 
resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_lb.main.id
  port              = 443
  protocol          = "HTTPS"
 
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.alb_tls_cert_arn
 
  default_action {
    target_group_arn = aws_lb_target_group.main.id
    type             = "forward"
  }
}
*/