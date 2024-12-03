# Hong Kong NAT
resource "aws_eip" "HongKong-NAT" {
  vpc = true

  tags = {
    Name        = "HongKong-NAT"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "HongKong-NAT" {
  allocation_id = aws_eip.HongKong-NAT.id
  subnet_id     = aws_subnet.public-ap-east-1a.id

  tags = {
    Name        = "HongKong-NAT"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.HongKong-IG]
}

# San Paulo NAT
resource "aws_eip" "SanPaulo-NAT" {
  vpc = true

  tags = {
    Name        = "SanPaulo-NAT"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "SanPaulo-NAT" {
  allocation_id = aws_eip.SanPaulo-NAT.id
  subnet_id     = aws_subnet.public-sa-east-1a.id

  tags = {
    Name        = "SanPaulo-NAT"
    Service     = "SanPaulo"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.SanPaulo-IG]
}

# New York NAT
resource "aws_eip" "NewYork-NAT" {
  vpc = true

  tags = {
    Name        = "NewYork-NAT"
    Service     = "NewYork"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "NewYork-NAT" {
  allocation_id = aws_eip.NewYork-NAT.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name        = "NewYork-NAT"
    Service     = "NewYork"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.NewYork-IG]
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
  subnet_id     = aws_subnet.ap-southeast-2a.id

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
  subnet_id     = aws_subnet.us-west-1a.id

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