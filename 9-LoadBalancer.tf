# Regions List
locals {
  tokyo_region      = "ap-northeast-1"
  newyork_region    = "us-east-1"
  london_region     = "eu-west-2"
  saopaulo_region   = "sa-east-1"
  australia_region  = "ap-southeast-2"
  hongkong_region   = "ap-east-1"
  california_region = "us-west-1"
}

# Load Balancers for Each Region
resource "aws_lb" "tokyo_alb" {
  name               = "tmmc-telehealth-alb-tokyo"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tokyo_sg.id]
  subnets            = [aws_subnet.tokyo_public_subnet_1.id, aws_subnet.tokyo_public_subnet_2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "tokyo"
    Environment = "Production"
  }
}

resource "aws_lb" "newyork_alb" {
  name               = "tmmc-telehealth-alb-newyork"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.newyork_sg.id]
  subnets            = [aws_subnet.newyork_public_subnet_1.id, aws_subnet.newyork_public_subnet_2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "newyork"
    Environment = "Production"
  }
}

resource "aws_lb" "london_alb" {
  name               = "tmmc-telehealth-alb-london"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.london_sg.id]
  subnets            = [aws_subnet.london_public_subnet_1.id, aws_subnet.london_public_subnet_2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "london"
    Environment = "Production"
  }
}

resource "aws_lb" "saopaulo_alb" {
  name               = "tmmc-telehealth-alb-saopaulo"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.saopaulo_sg.id]
  subnets            = [aws_subnet.saopaulo_public_subnet_1.id, aws_subnet.saopaulo_public_subnet_2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "saopaulo"
    Environment = "Production"
  }
}

resource "aws_lb" "australia_alb" {
  name               = "tmmc-telehealth-alb-australia"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.australia_sg.id]
  subnets            = [aws_subnet.australia_public_subnet_1.id, aws_subnet.australia_public_subnet_2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "australia"
    Environment = "Production"
  }
}

resource "aws_lb" "hongkong_alb" {
  name               = "tmmc-telehealth-alb-hongkong"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hongkong_sg.id]
  subnets            = [aws_subnet.hongkong_public_subnet_1.id, aws_subnet.hongkong_public_subnet_2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "hongkong"
    Environment = "Production"
  }
}

resource "aws_lb" "california_alb" {
  name               = "tmmc-telehealth-alb-california"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.california_sg.id]
  subnets            = [aws_subnet.california_public_subnet_1.id, aws_subnet.california_public_subnet_2.id]

  enable_deletion_protection = true

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "california"
    Environment = "Production"
  }
}