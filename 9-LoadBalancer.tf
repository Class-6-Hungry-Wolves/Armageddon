# Regions List
locals {
  regions = {
    tokyo      = "ap-northeast-1"
    newyork    = "us-east-1"
    london     = "eu-west-2"
    saopaulo   = "sa-east-1"
    australia  = "ap-southeast-2"
    hongkong   = "ap-east-1"
    california = "us-west-1"
  }
}

# Load Balancers for Each Region
resource "aws_lb" "regional_alb" {
  for_each = local.regions

  name               = "tmmc-telehealth-alb-${each.key}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.regional_sg[each.key].id]
  subnets            = aws_subnet.public_subnets[each.key][*].id

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = each.key
    Environment = "Production"
  }
}

# Target Groups
resource "aws_lb_target_group" "app_target_group" {
  for_each = local.regions

  name     = "tmmc-telehealth-tg-${each.key}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.regional_vpc[each.key].id

  health_check {
    path                = "/health"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200-399"
  }
}

# Load Balancer Listeners
resource "aws_lb_listener" "front_end" {
  for_each = local.regions

  load_balancer_arn = aws_lb.regional_alb[each.key].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group[each.key].arn
  }
}

# VPC Resource
resource "aws_vpc" "regional_vpc" {
  for_each = local.regions

  cidr_block = "10.${index(keys(local.regions), each.key)}.0.0/16"

  tags = {
    Name = "TMMC VPC - ${each.key}"
  }
}

# Public Subnets
resource "aws_subnet" "public_subnet_1" {
  for_each = local.regions

  vpc_id            = aws_vpc.regional_vpc[each.key].id
  cidr_block        = "10.${index(keys(local.regions), each.key)}.1.0/24"
  availability_zone = "${each.value}a"

  tags = {
    Name = "Public Subnet 1 - ${each.key}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  for_each = local.regions

  vpc_id            = aws_vpc.regional_vpc[each.key].id
  cidr_block        = "10.${index(keys(local.regions), each.key)}.2.0/24"
  availability_zone = "${each.value}b"

  tags = {
    Name = "Public Subnet 2 - ${each.key}"
  }
}

# Private Subnets
resource "aws_subnet" "private_subnet_1" {
  for_each = local.regions

  vpc_id            = aws_vpc.regional_vpc[each.key].id
  cidr_block        = "10.${index(keys(local.regions), each.key)}.10.0/24"
  availability_zone = "${each.value}a"

  tags = {
    Name = "Private Subnet 1 - ${each.key}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  for_each = local.regions

  vpc_id            = aws_vpc.regional_vpc[each.key].id
  cidr_block        = "10.${index(keys(local.regions), each.key)}.20.0/24"
  availability_zone = "${each.value}b"

  tags = {
    Name = "Private Subnet 2 - ${each.key}"
  }
}

# Security Group
resource "aws_security_group" "regional_sg" {
  for_each = local.regions

  name        = "tmmc-alb-sg-${each.key}"
  description = "Security group for TMMC Application Load Balancer"
  vpc_id      = aws_vpc.regional_vpc[each.key].id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}