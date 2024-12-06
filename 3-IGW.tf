

resource "aws_internet_gateway" "Tokyo-IG" {

  provider = aws.Tokyo

  vpc_id = aws_vpc.TMMC-Tokyo.id

  tags = {
    Name    = "TMMC-Tokyo"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_internet_gateway" "Hong-Kong-IG" {

  provider = aws.Hong-Kong

  vpc_id = aws_vpc.TMMC-Hong-Kong.id

  tags = {
    Name    = "TMMC-Hong-Kong"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_internet_gateway" "London-IG" {

  provider = aws.London

  vpc_id = aws_vpc.TMMC-London.id

  tags = {
    Name    = "TMMC-London"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_internet_gateway" "Sao-Paulo-IG" {

  provider = aws.Sao-Paulo

  vpc_id = aws_vpc.TMMC-Sao-Paulo.id

  tags = {
    Name    = "TMMC-Sao-Paulo"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_internet_gateway" "California-IG" {

  provider = aws.California

  vpc_id = aws_vpc.TMMC-California.id

  tags = {
    Name    = "TMMC-California"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_internet_gateway" "Australia-IG" {

  provider = aws.Australia

  vpc_id = aws_vpc.TMMC-Australia.id

  tags = {
    Name    = "TMMC-Australia"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_internet_gateway" "New-York-IG" {

  provider = aws.New-York

  vpc_id = aws_vpc.TMMC-New-York.id

  tags = {
    Name    = "TMMC-New-York"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}
