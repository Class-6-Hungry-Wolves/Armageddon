# These are the 
resource "aws_vpc" "TMMC-Tokyo" {
  provider = aws.Tokyo
  cidr_block = "10.80.0.0/16"

  tags = {
    Name    = "TMMC-Tokyo"
    Service = "J-Teledoctor"
    Team    = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_vpc" "TMMC-Hong-Kong" {
  provider = aws.Hong-Kong
  cidr_block = "10.81.0.0/16"

  tags = {
    Name    = "TMMC-Hong-Kong"
    Service = "J-Teledoctor"
    Team    = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_vpc" "TMMC-London" {
  provider    = aws.London
  cidr_block  = "10.82.0.0/16"

  tags = {
    Name    = "TMMC-London"
    Service = "J-Teledoctor"
    Team    = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_vpc" "TMMC-Sao-Paulo" {
  provider   = aws.Sao-Paulo
  cidr_block = "10.83.0.0/16"

  tags = {
    Name    = "TMMC-Sao-Paulo"
    Service = "J-Teledoctor"
    Team    = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_vpc" "TMMC-California" {
  provider   = aws.California
  cidr_block = "10.84.0.0/16"

  tags = {
    Name    = "TMMC-California"
    Service = "J-Teledoctor"
    Team    = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_vpc" "TMMC-Australia" {
  provider   = aws.Australia
  cidr_block = "10.85.0.0/16"

  tags = {
    Name    = "TMMC-Australia"
    Service = "J-Teledoctor"
    Team    = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_vpc" "TMMC-New-York" {
  provider   = aws.New-York
  cidr_block = "10.86.0.0/16"

  tags = {
    Name    = "TMMC-New-York"
    Service = "J-Teledoctor"
    Team    = "Hungry-Wolves"
    Planet  = "Earth"
  }
}
