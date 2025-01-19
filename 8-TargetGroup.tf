# Tokyo Target Group
resource "aws_lb_target_group" "Tokyo-TG-80" {
  provider    = aws.Tokyo
  name        = "Tokyo-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-Tokyo.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name       = "Tokyo-TG-80"
    Service    = "Target Group Port 80"
    Owner      = "alex"
    Team       = "HungryWolves"
    Assignment = "Armageddon"
  }
}

# Hong Kong Target Group
resource "aws_lb_target_group" "Hong-Kong-TG-80" {
  provider    = aws.Hong-Kong
  name        = "Hong-Kong-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-Hong-Kong.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name       = "Hong-Kong-TG-80"
    Service    = "Target Group Port 80"
    Owner      = "alex"
    Team       = "HungryWolves"
    Assignment = "Armageddon"
  }
}

# San Paulo Target Group
resource "aws_lb_target_group" "Sao-Paulo-TG-80" {
  provider    = aws.Sao-Paulo
  name        = "Sao-Paulo-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-Sao-Paulo.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name       = "Sao-Paulo-TG-80"
    Service    = "Target Group 80"
    Owner      = "alex"
    Team       = "HungryWolves"
    Assignment = "Armageddon"
  }
}

# London Target Group
resource "aws_lb_target_group" "London-TG-80" {
  provider    = aws.London
  name        = "London-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-London.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name       = "London-TG-80"
    Service    = "Target Group Port 80"
    Owner      = "alex"
    Team       = "HungryWolves"
    Assignment = "Armageddon"
  }
}

# California Target Group
resource "aws_lb_target_group" "California-TG-80" {
  provider    = aws.California
  name        = "California-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-California.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name       = "California-TG-80"
    Service    = "Target Group Port 80"
    Owner      = "alex"
    Team       = "HungryWolves"
    Assignment = "Armageddon"
  }
}

# Australia Target Group
resource "aws_lb_target_group" "Australia-TG-80" {
  provider    = aws.Australia
  name        = "Australia-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-Australia.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name       = "Australia-TG-80"
    Service    = "Target Group Port 80"
    Owner      = "alex"
    Team       = "HungryWolves"
    Assignment = "Armageddon"
  }
}

# New-York Target Group
resource "aws_lb_target_group" "New-York-TG-80" {
  provider    = aws.New-York
  name        = "New-York-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-New-York.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name       = "New-York-TG-80"
    Service    = "Target Group Port 80"
    Owner      = "alex"
    Team       = "HungryWolves"
    Assignment = "Armageddon"
  }
}

resource "aws_lb_target_group" "Syslog-TG-80" {
  provider    = aws.Tokyo
  name        = "Syslog-TG-80"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.TMMC-Tokyo.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }
}