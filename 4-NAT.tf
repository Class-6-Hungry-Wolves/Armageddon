# Hong Kong NAT
resource "aws_eip" "Hong-Kong-NAT" {
  vpc = true

  tags = {
    Name        = "Hong-Kong-NAT"
    Service     = "Hong-Kong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "Hong-Kong-NAT" {
  allocation_id = aws_eip.Hong-Kong-NAT.id
  subnet_id     = aws_subnet.public-ap-east-1a.id

  tags = {
    Name        = "Hong-Kong-NAT"
    Service     = "Hong-Kong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.Hong-Kong-IG]
}

# Sao Paulo NAT
resource "aws_eip" "Sao-Paulo-NAT" {
  vpc = true

  tags = {
    Name        = "Sao-Paulo-NAT"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "Sao-Paulo-NAT" {
  allocation_id = aws_eip.Sao-Paulo-NAT.id
  subnet_id     = aws_subnet.public-sa-east-1a.id

  tags = {
    Name        = "Sao-Paulo-NAT"
    Service     = "Sao-Paulo"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.Sao-Paulo-IG]
}

# New York NAT
resource "aws_eip" "New-York-NAT" {
  vpc = true

  tags = {
    Name        = "New-York-NAT"
    Service     = "New-York"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "New-York-NAT" {
  allocation_id = aws_eip.New-York-NAT.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name        = "New-York-NAT"
    Service     = "New-York"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.New-York-IG]
}

# London NAT
resource "aws_eip" "London-NAT" {
  vpc = true

  tags = {
    Name        = "London-NAT"
    Service     = "London"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "London-NAT" {
  allocation_id = aws_eip.London-NAT.id
  subnet_id     = aws_subnet.public-eu-west-2a.id

  tags = {
    Name        = "London-NAT"
    Service     = "London"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.London-IG]
}

# Australia NAT
resource "aws_eip" "Australia-NAT" {
  vpc = true

  tags = {
    Name        = "Australia-NAT"
    Service     = "Australia"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "Australia-NAT" {
  allocation_id = aws_eip.Australia-NAT.id
  subnet_id     = aws_subnet.public-ap-southeast-2a.id

  tags = {
    Name        = "Australia-NAT"
    Service     = "Australia"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.Australia-IG]
}

# California NAT
resource "aws_eip" "California-NAT" {
  vpc = true

  tags = {
    Name        = "California-NAT"
    Service     = "California"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "California-NAT" {
  allocation_id = aws_eip.California-NAT.id
  subnet_id     = aws_subnet.public-us-west-1a.id

  tags = {
    Name        = "California-NAT"
    Service     = "California"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.California-IG]
}

# Tokyo NAT
resource "aws_eip" "Tokyo-NAT" {
  vpc = true

  tags = {
    Name        = "Tokyo-NAT"
    Service     = "Tokyo"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "Tokyo-NAT" {
  allocation_id = aws_eip.Tokyo-NAT.id
  subnet_id     = aws_subnet.public-ap-northeast-1a.id

  tags = {
    Name        = "Tokyo-NAT"
    Service     = "Tokyo"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.Tokyo-IG]
}