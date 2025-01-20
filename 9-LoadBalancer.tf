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
  provider           = aws.Tokyo
  name               = "tmmc-telehealth-alb-tokyo"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.TMMC-Tokyo-sg02-LB.id]
  subnets            = [aws_subnet.public-ap-northeast-1a.id, aws_subnet.public-ap-northeast-1c.id]

  enable_deletion_protection = false

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "tokyo"
    Environment = "Production"
  }
}

resource "aws_lb" "newyork_alb" {
  provider           = aws.New-York
  name               = "tmmc-telehealth-alb-newyork"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.TMMC-New-York-sg02-LB.id]
  subnets            = [aws_subnet.public-us-east-1a.id, aws_subnet.public-us-east-1b.id]

  enable_deletion_protection = false

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "newyork"
    Environment = "Production"
  }
}

resource "aws_lb" "london_alb" {
  provider           = aws.London
  name               = "tmmc-telehealth-alb-london"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.TMMC-London-sg02-LB.id]
  subnets            = [aws_subnet.public-eu-west-2a.id, aws_subnet.public-eu-west-2b.id]

  enable_deletion_protection = false

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "london"
    Environment = "Production"
  }
}

resource "aws_lb" "saopaulo_alb" {
  provider           = aws.Sao-Paulo
  name               = "tmmc-telehealth-alb-saopaulo"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.TMMC-Sao-Paulo-sg02-LB.id]
  subnets            = [aws_subnet.public-sa-east-1a.id, aws_subnet.public-sa-east-1c.id]

  enable_deletion_protection = false

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "saopaulo"
    Environment = "Production"
  }
}

resource "aws_lb" "australia_alb" {
  provider           = aws.Australia
  name               = "tmmc-telehealth-alb-australia"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.TMMC-Australia-sg02-LB.id]
  subnets            = [aws_subnet.public-ap-southeast-2a.id, aws_subnet.public-ap-southeast-2b.id]

  enable_deletion_protection = false

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "australia"
    Environment = "Production"
  }
}

resource "aws_lb" "hongkong_alb" {
  provider           = aws.Hong-Kong
  name               = "tmmc-telehealth-alb-hongkong"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.TMMC-Hong-Kong-sg02-LB.id]
  subnets            = [aws_subnet.public-ap-east-1a.id, aws_subnet.public-ap-east-1b.id]

  enable_deletion_protection = false

  tags = {
    Name        = "TMMC Telehealth ALB"
    Region      = "hongkong"
    Environment = "Production"
  }
}

resource "aws_lb" "california_alb" {
  provider           = aws.California
  name               = "tmmc-telehealth-alb-california"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.TMMC-California-sg02-LB.id]
  subnets            = [aws_subnet.public-us-west-1a.id, aws_subnet.public-us-west-1b.id]

  enable_deletion_protection = false

  tags = {
    Name        = "TMMC Telehealth Target Group"
    Region      = "california"
    Environment = "Production"
  }
}