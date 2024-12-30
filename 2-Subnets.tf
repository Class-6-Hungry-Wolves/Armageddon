#These are for public subnets for Tokyo region

resource "aws_subnet" "public-ap-northeast-1a" {
  provider = aws.Tokyo
  vpc_id                  = aws_vpc.TMMC-Tokyo.id
  cidr_block              = "10.80.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Tokyo-public-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-ap-northeast-1c" {
  provider = aws.Tokyo
  vpc_id                  = aws_vpc.TMMC-Tokyo.id
  cidr_block              = "10.80.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Tokyo-public-1c"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are for public subnets in Hong Kong region

resource "aws_subnet" "public-ap-east-1a" {
  provider = aws.Hong-Kong
  vpc_id                  = aws_vpc.TMMC-Hong-Kong.id
  cidr_block              = "10.81.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Hong-Kong-public-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-ap-east-1b" {
  provider = aws.Hong-Kong
  vpc_id                  = aws_vpc.TMMC-Hong-Kong.id
  cidr_block              = "10.81.2.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Hong-Kong-public-1b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}
#These are public subnets for London Region

resource "aws_subnet" "public-eu-west-2a" {
  provider = aws.London
  vpc_id                  = aws_vpc.TMMC-London.id
  cidr_block              = "10.82.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-London-public-2a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-eu-west-2b" {
  provider = aws.London
  vpc_id                  = aws_vpc.TMMC-London.id
  cidr_block              = "10.82.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-London-public-2b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are public subnets for Sao Paulo

resource "aws_subnet" "public-sa-east-1a" {
  provider = aws.Sao-Paulo
  vpc_id                  = aws_vpc.TMMC-Sao-Paulo.id
  cidr_block              = "10.83.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Sao-Paulo-public-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-sa-east-1c" {
  provider = aws.Sao-Paulo
  vpc_id                  = aws_vpc.TMMC-Sao-Paulo.id
  cidr_block              = "10.83.3.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Sao-Paulo-public-1c"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are public subnets for California
resource "aws_subnet" "public-us-west-1a" {
  provider = aws.California
  vpc_id                  = aws_vpc.TMMC-California.id
  cidr_block              = "10.84.3.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-California-public-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-us-west-1b" {
  provider = aws.California
  vpc_id                  = aws_vpc.TMMC-California.id
  cidr_block              = "10.84.2.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-California-public-1b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are public subnets for Australia
resource "aws_subnet" "public-ap-southeast-2a" {
  provider = aws.Australia
  vpc_id                  = aws_vpc.TMMC-Australia.id
  cidr_block              = "10.85.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Australia-public-2a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-ap-southeast-2b" {
  provider = aws.Australia
  vpc_id                  = aws_vpc.TMMC-Australia.id
  cidr_block              = "10.85.2.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-Australia-public-2b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are public subnets for New York 
resource "aws_subnet" "public-us-east-1a" {
  provider = aws.New-York
  vpc_id                  = aws_vpc.TMMC-New-York.id
  cidr_block              = "10.86.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-New-York-public-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  provider = aws.New-York
  vpc_id                  = aws_vpc.TMMC-New-York.id
  cidr_block              = "10.86.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "TMMC-New-York-public-1b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}


#these are for private for Tokyo region

resource "aws_subnet" "private-ap-northeast-1a" {
  provider = aws.Tokyo
  vpc_id            = aws_vpc.TMMC-Tokyo.id
  cidr_block        = "10.80.11.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name    = "TMMC-Tokyo-private-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-ap-northeast-1c" {
  provider = aws.Tokyo
  vpc_id            = aws_vpc.TMMC-Tokyo.id
  cidr_block        = "10.80.13.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name    = "TMMC-Tokyo-private-1c"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}
# Syslog server subnet

resource "aws_subnet" "private-ap-northeast-1d-SYS" {
  provider = aws.Tokyo 
  vpc_id = aws_vpc.TMMC-Tokyo.id
  cidr_block = "10.80.14.0/24"
  availability_zone = "ap-northeast-1d"
  tags = {
    Name    = "TMMC-Tokyo-private-1d"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

# Tokyo Database subnet

resource "aws_subnet" "private-ap-northeast-1d-DB" {
  provider          = aws.Tokyo 
  vpc_id            = aws_vpc.TMMC-Tokyo.id
  cidr_block        = "10.80.54.0/24"
  availability_zone = "ap-northeast-1d"
  tags = {
    Name    = "TMMC-Tokyo-private-1d"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}
#These are private for Hong Kong region 

resource "aws_subnet" "private-ap-east-1a" {
  provider = aws.Hong-Kong
  vpc_id            = aws_vpc.TMMC-Hong-Kong.id
  cidr_block        = "10.81.11.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name    = "TMMC-Hong-Kong-private-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-ap-east-1b" {
  provider = aws.Hong-Kong
  vpc_id            = aws_vpc.TMMC-Hong-Kong.id
  cidr_block        = "10.81.12.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name    = "TMMC-Hong-Kong-private-1b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

# These are private subnets for London 

resource "aws_subnet" "private-eu-west-2a" {
  provider = aws.London
  vpc_id            = aws_vpc.TMMC-London.id
  cidr_block        = "10.82.11.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name    = "TMMC-London-private-2a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-eu-west-2b" {
  provider = aws.London
  vpc_id            = aws_vpc.TMMC-London.id
  cidr_block        = "10.82.12.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name    = "TMMC-London-private-2b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are private subnets for Sao Paulo

resource "aws_subnet" "private-sa-east-1a" {
  provider = aws.Sao-Paulo
  vpc_id            = aws_vpc.TMMC-Sao-Paulo.id
  cidr_block        = "10.83.11.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name    = "TMMC-Sao-Paulo-private-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-sa-east-1c" {
  provider = aws.Sao-Paulo
  vpc_id            = aws_vpc.TMMC-Sao-Paulo.id
  cidr_block        = "10.83.13.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name    = "TMMC-Sao-Paulo-private-1c"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are private subnets for California region

resource "aws_subnet" "private-us-west-1a" {
  provider = aws.California
  vpc_id            = aws_vpc.TMMC-California.id
  cidr_block        = "10.84.13.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name    = "TMMC-California-private-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-us-west-1b" {
  provider = aws.California
  vpc_id            = aws_vpc.TMMC-California.id
  cidr_block        = "10.84.12.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name    = "TMMC-California-private-1b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are private subnets for Australia 

resource "aws_subnet" "private-ap-southeast-2a" {
  provider = aws.Australia
  vpc_id            = aws_vpc.TMMC-Australia.id
  cidr_block        = "10.85.11.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name    = "TMMC-Australia-private-2a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-ap-southeast-2b" {
  provider = aws.Australia
  vpc_id            = aws_vpc.TMMC-Australia.id
  cidr_block        = "10.85.12.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name    = "TMMC-Australia-private-2b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

#These are private subnets for New York

resource "aws_subnet" "private-us-east-1a" {
  provider = aws.New-York
  vpc_id            = aws_vpc.TMMC-New-York.id
  cidr_block        = "10.86.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "TMMC-New-York-private-1a"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  provider = aws.New-York
  vpc_id            = aws_vpc.TMMC-New-York.id
  cidr_block        = "10.86.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "TMMC-New-York-private-1b"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}