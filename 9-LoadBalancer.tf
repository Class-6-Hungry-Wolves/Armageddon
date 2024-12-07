locals {
  regions = {
    tokyo = {
      name = "ap-northeast-1"
      sg_id = aws_security_group.tokyo_sg.id
      subnets = [aws_subnet.tokyo_public_subnet_1.id, aws_subnet.tokyo_public_subnet_2.id]
    }
    newyork = {
      name = "us-east-1"
      sg_id = aws_security_group.newyork_sg.id
      subnets = [aws_subnet.newyork_public_subnet_1.id, aws_subnet.newyork_public_subnet_2.id]
    }
    london = {
      name = "eu-west-2"
      sg_id = aws_security_group.london_sg.id
      subnets = [aws_subnet.london_public_subnet_1.id, aws_subnet.london_public_subnet_2.id]
    }
    saopaulo = {
      name = "sa-east-1"
      sg_id = aws_security_group.saopaulo_sg.id
      subnets = [aws_subnet.saopaulo_public_subnet_1.id, aws_subnet.saopaulo_public_subnet_2.id]
    }
    australia = {
      name = "ap-southeast-2"
      sg_id = aws_security_group.australia_sg.id
      subnets = [aws_subnet.australia_public_subnet_1.id, aws_subnet.australia_public_subnet_2.id]
    }
    hongkong = {
      name = "ap-east-1"
      sg_id = aws_security_group.hongkong_sg.id
      subnets = [aws_subnet.hongkong_public_subnet_1.id, aws_subnet.hongkong_public_subnet_2.id]
    }
    california = {
      name = "us-west-1"
      sg_id = aws_security_group.california_sg.id
      subnets = [aws_subnet.california_public_subnet_1.id, aws_subnet.california_public_subnet_2.id]
    }
  }
}

resource "aws_lb" "telehealth_alb" {
  for_each = local.regions

  name               = "tmmc-telehealth-alb-${each.key}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [each.value.sg_id]
  subnets            = each.value.subnets

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = each.key
    Environment = "Production"
  }
}

# HTTPS Listener
resource "aws_lb_listener" "telehealth_https_listener" {
  for_each = local.regions

  load_balancer_arn = aws_lb.telehealth_alb[each.key].arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.ssl_certificate_arn  # You'll need to define this variable

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.telehealth_tg[each.key].arn
  }
}

# HTTP Listener (Redirect to HTTPS)
resource "aws_lb_listener" "telehealth_http_listener" {
  for_each = local.regions

  load_balancer_arn = aws_lb.telehealth_alb[each.key].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Target Group
resource "aws_lb_target_group" "telehealth_tg" {
  for_each = local.regions

  name     = "tmmc-telehealth-tg-${each.key}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc[each.key].id  # Assumes you have a VPC resource for each region

  health_check {
    enabled             = true
    path                = "/health"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }

  tags = {
    Name        = "TMMC Telehealth Target Group"
    Region      = each.key
    Environment = "Production"
  }
}