resource "aws_security_group" "TMMC-Tokyo-sg01-servers" {
  name        = "TMMC-Tokyo-sg01-servers"
  provider = aws.Tokyo
  description = "TMMC-Tokyo-sg01-servers"
  vpc_id      = aws_vpc.TMMC-Tokyo.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "TMMC-Tokyo"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }

}


resource "aws_security_group" "TMMC-California-sg01-servers" {
  name        = "TMMC-California-sg01-servers"
  provider = aws.California
  description = "TMMC-California-sg01-servers"
  vpc_id      = aws_vpc.TMMC-California.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "TMMC-California"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }

}

resource "aws_security_group" "TMMC-Australia-sg01-servers" {
  name        = "TMMC-Australia-sg01-servers"
  provider = aws.Australia
  description = "TMMC-Australia-sg01-servers"
  vpc_id      = aws_vpc.TMMC-Australia.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "TMMC-Australia"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }

}

resource "aws_security_group" "TMMC-Hong-Kong-sg01-servers" {
  name        = "TMMC-Hong-Kong-sg01-servers"
  provider = aws.Hong-Kong
  description = "TMMC-Hong-Kong-sg01-servers"
  vpc_id      = aws_vpc.TMMC-Hong-Kong.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "TMMC-Hong-Kong"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }

}

resource "aws_security_group" "TMMC-New-York-sg01-servers" {
  name        = "TMMC-New-York-sg01-servers"
  provider = aws.New-York
  description = "TMMC-New-York-sg01-servers"
  vpc_id      = aws_vpc.TMMC-New-York.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "TMMC-New-York"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }

}

resource "aws_security_group" "TMMC-London-sg01-servers" {
  name        = "TMMC-London-sg01-servers"
  provider = aws.London
  description = "TMMC-London-sg01-servers"
  vpc_id      = aws_vpc.TMMC-London.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "TMMC-London"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }

}

resource "aws_security_group" "TMMC-Sao-Paulo-sg01-servers" {
  name        = "TMMC-Sao-Paulo-sg01-servers"
  provider = aws.Sao-Paulo
  description = "TMMC-Sao-Paulo-sg01-servers"
  vpc_id      = aws_vpc.TMMC-Sao-Paulo.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "TMMC-Sao-Paulo"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }

}


