#Tokyo
#private

resource "aws_route_table" "Tokyo-private-rtb" {
  provider = aws.Tokyo
  vpc_id   = aws_vpc.TMMC-Tokyo.id

  tags = {
    Name = "TMMC-Tokyo-private"
  }
}

resource "aws_route" "tokyo_to_hong_kong" {
  provider               = aws.Tokyo
  route_table_id         = aws_route_table.Tokyo-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Hong-Kong.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Tokyo_TGW.id
}

resource "aws_route" "tokyo_to_london" {
  provider               = aws.Tokyo
  route_table_id         = aws_route_table.Tokyo-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-London.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Tokyo_TGW.id
}

resource "aws_route" "tokyo_to_sao_paulo" {
  provider               = aws.Tokyo
  route_table_id         = aws_route_table.Tokyo-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Sao-Paulo.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Tokyo_TGW.id
}

resource "aws_route" "tokyo_to_california" {
  provider               = aws.Tokyo
  route_table_id         = aws_route_table.Tokyo-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-California.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Tokyo_TGW.id
}

resource "aws_route" "tokyo_to_australia" {
  provider               = aws.Tokyo
  route_table_id         = aws_route_table.Tokyo-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Australia.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Tokyo_TGW.id
}

resource "aws_route" "tokyo_to_new_york" {
  provider               = aws.Tokyo
  route_table_id         = aws_route_table.Tokyo-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-New-York.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Tokyo_TGW.id
}
# Tokyo
# public

resource "aws_route_table" "Tokyo-public-rtb" {
  provider = aws.Tokyo
  vpc_id   = aws_vpc.TMMC-Tokyo.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.Tokyo-IG.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "TMMC-Tokyo-public"
  }
}




resource "aws_route_table_association" "private-ap-northeast-1a" {
  provider       = aws.Tokyo
  subnet_id      = aws_subnet.private-ap-northeast-1a.id
  route_table_id = aws_route_table.Tokyo-private-rtb.id
}

resource "aws_route_table_association" "private-ap-northeast-1c" {
  provider       = aws.Tokyo
  subnet_id      = aws_subnet.private-ap-northeast-1c.id
  route_table_id = aws_route_table.Tokyo-private-rtb.id
}

resource "aws_route_table_association" "private-ap-northeast-1d-SYS" {
  provider       = aws.Tokyo
  subnet_id      = aws_subnet.private-ap-northeast-1d-SYS.id
  route_table_id = aws_route_table.Tokyo-private-rtb.id
}

resource "aws_route_table_association" "private-ap-northeast-1d-DB" {
  provider       = aws.Tokyo
  subnet_id      = aws_subnet.private-ap-northeast-1d-DB.id
  route_table_id = aws_route_table.Tokyo-private-rtb.id
}

# public

resource "aws_route_table_association" "public-ap-northeast-1a" {
  provider       = aws.Tokyo
  subnet_id      = aws_subnet.public-ap-northeast-1a.id
  route_table_id = aws_route_table.Tokyo-public-rtb.id
}

resource "aws_route_table_association" "public-ap-northeast-1c" {
  provider       = aws.Tokyo
  subnet_id      = aws_subnet.public-ap-northeast-1c.id
  route_table_id = aws_route_table.Tokyo-public-rtb.id
}




#Hong Kong
#private

resource "aws_route_table" "Hong-Kong-private-rtb" {
  provider = aws.Hong-Kong
  vpc_id   = aws_vpc.TMMC-Hong-Kong.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Hong-Kong-NAT.id
  }

  tags = {
    Name = "Hong-Kong-private"
  }
}

resource "aws_route" "hong_kong_to_tokyo" {
  provider               = aws.Hong-Kong
  route_table_id         = aws_route_table.Hong-Kong-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Hong_Kong_TGW.id
}

#Hong Kong
#public

resource "aws_route_table" "Hong-Kong-public-rtb" {
  provider = aws.Hong-Kong
  vpc_id   = aws_vpc.TMMC-Hong-Kong.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.Hong-Kong-IG.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "Hong-Kong-public"
  }
}

#Hong Kong
#private

resource "aws_route_table_association" "private-ap-east-1a" {
  provider       = aws.Hong-Kong
  subnet_id      = aws_subnet.private-ap-east-1a.id
  route_table_id = aws_route_table.Hong-Kong-private-rtb.id
}

resource "aws_route_table_association" "private-ap-east-1b" {
  provider       = aws.Hong-Kong
  subnet_id      = aws_subnet.private-ap-east-1b.id
  route_table_id = aws_route_table.Hong-Kong-private-rtb.id
}
# public

resource "aws_route_table_association" "public-ap-east-1a" {
  provider       = aws.Hong-Kong
  subnet_id      = aws_subnet.public-ap-east-1a.id
  route_table_id = aws_route_table.Hong-Kong-public-rtb.id
}

resource "aws_route_table_association" "public-ap-east-1b" {
  provider       = aws.Hong-Kong
  subnet_id      = aws_subnet.public-ap-east-1b.id
  route_table_id = aws_route_table.Hong-Kong-public-rtb.id
}


#London
#private

resource "aws_route_table" "London-private-rtb" {
  provider = aws.London
  vpc_id   = aws_vpc.TMMC-London.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.London-NAT.id
  }

  tags = {
    Name = "TMMC-London-private"

  }
  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.London_to_tokyo,
    aws_ec2_transit_gateway_peering_attachment_accepter.accept_London_to_tokyo
  ]
}

resource "aws_route" "london_to_tokyo" {
  provider               = aws.London
  route_table_id         = aws_route_table.London-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.London_TGW.id
}

#London
#public

resource "aws_route_table" "London-public-rtb" {
  provider = aws.London
  vpc_id   = aws_vpc.TMMC-London.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.London-IG.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "TMMC-London-public"
  }
}

#London

# #private

resource "aws_route_table_association" "private-eu-west-2a" {
  provider       = aws.London
  subnet_id      = aws_subnet.private-eu-west-2a.id
  route_table_id = aws_route_table.London-private-rtb.id
}

resource "aws_route_table_association" "private-eu-west-2b" {
  provider       = aws.London
  subnet_id      = aws_subnet.private-eu-west-2b.id
  route_table_id = aws_route_table.London-private-rtb.id
}
#London public



resource "aws_route_table_association" "public-eu-west-2a" {
  provider       = aws.London
  subnet_id      = aws_subnet.public-eu-west-2a.id
  route_table_id = aws_route_table.London-public-rtb.id
}

resource "aws_route_table_association" "public-eu-west-2b" {
  provider       = aws.London
  subnet_id      = aws_subnet.public-eu-west-2b.id
  route_table_id = aws_route_table.London-public-rtb.id
}




#Sao-Paulo

#private

resource "aws_route_table" "Sao-Paulo-private-rtb" {
  provider = aws.Sao-Paulo
  vpc_id   = aws_vpc.TMMC-Sao-Paulo.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Sao-Paulo-NAT.id
  }

  tags = {
    Name = "TMMC-Sao-Paulo-private"
  }
  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.Sao_Paulo_to_tokyo,
    aws_ec2_transit_gateway_peering_attachment_accepter.accept_Sao_Paulo_to_tokyo
  ]
}

resource "aws_route" "sao_paulo_to_tokyo" {
  provider               = aws.Sao-Paulo
  route_table_id         = aws_route_table.Sao-Paulo-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Sao_Paulo_TGW.id
}
#Sao-Paulo
# Public

resource "aws_route_table" "Sao-Paulo-public-rtb" {
  provider = aws.Sao-Paulo
  vpc_id   = aws_vpc.TMMC-Sao-Paulo.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.Sao-Paulo-IG.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "TMMC-Sao-Paulo-public"
  }
}




# Sao Paulo

#private

resource "aws_route_table_association" "private-sa-east-1a" {
  provider       = aws.Sao-Paulo
  subnet_id      = aws_subnet.private-sa-east-1a.id
  route_table_id = aws_route_table.Sao-Paulo-private-rtb.id
}

resource "aws_route_table_association" "private-sa-east-1c" {
  provider       = aws.Sao-Paulo
  subnet_id      = aws_subnet.private-sa-east-1c.id
  route_table_id = aws_route_table.Sao-Paulo-private-rtb.id
}
#public

resource "aws_route_table_association" "public-sa-east-1a" {
  provider       = aws.Sao-Paulo
  subnet_id      = aws_subnet.public-sa-east-1a.id
  route_table_id = aws_route_table.Sao-Paulo-public-rtb.id
}

resource "aws_route_table_association" "public-sa-east-1c" {
  provider       = aws.Sao-Paulo
  subnet_id      = aws_subnet.public-sa-east-1c.id
  route_table_id = aws_route_table.Sao-Paulo-public-rtb.id
}




resource "aws_route_table" "California-private-rtb" {
  provider = aws.California
  vpc_id   = aws_vpc.TMMC-California.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.California-NAT.id
  }

  tags = {
    Name = "TMMC-California-private"
  }
  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.California_to_tokyo,
    aws_ec2_transit_gateway_peering_attachment_accepter.accept_California_to_tokyo
  ]
}

resource "aws_route" "california_to_tokyo" {
  provider               = aws.California
  route_table_id         = aws_route_table.California-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.California_TGW.id
}

resource "aws_route_table" "California-public-rtb" {
  provider = aws.California
  vpc_id   = aws_vpc.TMMC-California.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.California-IG.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "TMMC-California-public"
  }
}
# California

# private
resource "aws_route_table_association" "private-us-west-1a" {
  provider       = aws.California
  subnet_id      = aws_subnet.private-us-west-1a.id
  route_table_id = aws_route_table.California-private-rtb.id
}

resource "aws_route_table_association" "private-us-west-1b" {
  provider       = aws.California
  subnet_id      = aws_subnet.private-us-west-1b.id
  route_table_id = aws_route_table.California-private-rtb.id
}

#public

resource "aws_route_table_association" "public-us-west-1a" {
  provider       = aws.California
  subnet_id      = aws_subnet.public-us-west-1a.id
  route_table_id = aws_route_table.California-public-rtb.id
}

resource "aws_route_table_association" "public-us-west-1b" {
  provider       = aws.California
  subnet_id      = aws_subnet.public-us-west-1b.id
  route_table_id = aws_route_table.California-public-rtb.id
}

resource "aws_route_table" "Australia-private-rtb" {
  provider = aws.Australia
  vpc_id   = aws_vpc.TMMC-Australia.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Australia-NAT.id
  }

  tags = {
    Name = "TMMC-Australia-private"
  }
  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.Australia_to_tokyo,
    aws_ec2_transit_gateway_peering_attachment_accepter.accept_Australia_to_tokyo
  ]
}

resource "aws_route" "australia_to_tokyo" {
  provider               = aws.Australia
  route_table_id         = aws_route_table.Australia-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.Australia_TGW.id
}

resource "aws_route_table" "Australia-public-rtb" {
  provider = aws.Australia
  vpc_id   = aws_vpc.TMMC-Australia.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.Australia-IG.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "TMMC-Australia-public"
  }
}

# Australia

# private

resource "aws_route_table_association" "private-ap-southeast-2a" {
  provider       = aws.Australia
  subnet_id      = aws_subnet.private-ap-southeast-2a.id
  route_table_id = aws_route_table.Australia-private-rtb.id
}

resource "aws_route_table_association" "private-ap-southeast-2b" {
  provider       = aws.Australia
  subnet_id      = aws_subnet.private-ap-southeast-2b.id
  route_table_id = aws_route_table.Australia-private-rtb.id
}
# public

resource "aws_route_table_association" "public-ap-southeast-2a" {
  provider       = aws.Australia
  subnet_id      = aws_subnet.public-ap-southeast-2a.id
  route_table_id = aws_route_table.Australia-public-rtb.id
}

resource "aws_route_table_association" "public-ap-southeast-2b" {
  provider       = aws.Australia
  subnet_id      = aws_subnet.public-ap-southeast-2b.id
  route_table_id = aws_route_table.Australia-public-rtb.id
}



resource "aws_route_table" "New-York-private-rtb" {
  provider = aws.New-York
  vpc_id   = aws_vpc.TMMC-New-York.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.New-York-NAT.id
  }

  tags = {
    Name = "TMMC-New-York-private"
  }
  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.New_York_to_tokyo,
    aws_ec2_transit_gateway_peering_attachment_accepter.accept_New_York_to_tokyo
  ]
}


resource "aws_route" "new_york_to_tokyo" {
  provider               = aws.New-York
  route_table_id         = aws_route_table.New-York-private-rtb.id
  destination_cidr_block = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.New_York_TGW.id
}

resource "aws_route_table" "New-York-public-rtb" {
  provider = aws.New-York
  vpc_id   = aws_vpc.TMMC-New-York.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.New-York-IG.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "TMMC-New-York-public"
  }
}

#New York

# private

resource "aws_route_table_association" "private-us-east-1a" {
  provider       = aws.New-York
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.New-York-private-rtb.id
}

resource "aws_route_table_association" "private-us-east-1b" {
  provider       = aws.New-York
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.New-York-private-rtb.id
}
# public

resource "aws_route_table_association" "public-us-east-1a" {
  provider       = aws.New-York
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.New-York-public-rtb.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  provider       = aws.New-York
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.New-York-public-rtb.id
}
