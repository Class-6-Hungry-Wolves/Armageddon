resource "aws_ec2_transit_gateway_route_table" "hong_kong" {
  provider           = aws.Hong-Kong
  transit_gateway_id = aws_ec2_transit_gateway.Hong_Kong_TGW.id

  tags = {
    Name = "Hong-Kong-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route" "hong_kong_local_vpc_route" {
  provider                       = aws.Hong-Kong
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id
  destination_cidr_block         = aws_vpc.TMMC-Hong-Kong.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hong_kong_vpc_attachment.id
}

resource "aws_ec2_transit_gateway_route" "hong_kong_to_tokyo_route" {
  provider                       = aws.Hong-Kong
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id
}

resource "aws_ec2_transit_gateway_route_table_association" "hong_kong_peering_association" {
  provider                       = aws.Hong-Kong
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id
}

resource "aws_ec2_transit_gateway_route_table_association" "hong_kong_vpc_association" {
  provider                       = aws.Hong-Kong
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hong_kong_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id
}

# Tokyo Transit Gateway Route Table entries
resource "aws_ec2_transit_gateway_route_table" "tokyo" {
  provider           = aws.Tokyo
  transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id

  tags = {
    Name = "Tokyo-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_hong_kong_route" {
  provider                       = aws.Tokyo
  destination_cidr_block         = aws_vpc.TMMC-Hong-Kong.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id
}

resource "aws_ec2_transit_gateway_route" "tokyo_local_vpc_route" {
  provider                       = aws.Tokyo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo_vpc_attachment.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_vpc_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_peering_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id
}

# London Transit Gateway Route Table entries
resource "aws_ec2_transit_gateway_route_table" "London" {
  provider           = aws.London
  transit_gateway_id = aws_ec2_transit_gateway.London_TGW.id

  tags = {
    Name = "London-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route" "london_local_vpc_route" {
  provider                       = aws.London
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.London.id
  destination_cidr_block         = aws_vpc.TMMC-London.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.london_vpc_attachment.id
}

resource "aws_ec2_transit_gateway_route" "london_to_tokyo_route" {
  provider                       = aws.London
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.london_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london.id
}

resource "aws_ec2_transit_gateway_route_table_association" "london_peering_association" {
  provider                       = aws.London
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.london_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london.id
}

resource "aws_ec2_transit_gateway_route_table_association" "hong_kong_vpc_association" {
  provider                       = aws.London
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.london_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london.id
}

# Australia Transit Gateway Route Table entries
resource "aws_ec2_transit_gateway_route_table" "Australia" {
  provider           = aws.Australia
  transit_gateway_id = aws_ec2_transit_gateway.Australia_TGW.id

  tags = {
    Name = "Australia-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route" "Australia_local_vpc_route" {
  provider                       = aws.Australia
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Australia.id
  destination_cidr_block         = aws_vpc.TMMC-Australia.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.Australia_vpc_attachment.id
}

resource "aws_ec2_transit_gateway_route" "Australia_to_tokyo_route" {
  provider                       = aws.Australia
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.australia_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Australia.id
}

resource "aws_ec2_transit_gateway_route_table_association" "Australia_peering_association" {
  provider                       = aws.Australia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.australia_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Australia.id
}

resource "aws_ec2_transit_gateway_route_table_association" "australia_vpc_association" {
  provider                       = aws.Australia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.Australia_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Australia.id
}

# California Transit Gateway Route Table entries
resource "aws_ec2_transit_gateway_route_table" "California" {
  provider           = aws.California
  transit_gateway_id = aws_ec2_transit_gateway.California_TGW.id

  tags = {
    Name = "California-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route" "California_local_vpc_route" {
  provider                       = aws.California
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.California.id
  destination_cidr_block         = aws_vpc.TMMC-California.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.Australia_vpc_attachment.id
}

resource "aws_ec2_transit_gateway_route" "California_to_tokyo_route" {
  provider                       = aws.California
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.California_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.California.id
}

resource "aws_ec2_transit_gateway_route_table_association" "California_peering_association" {
  provider                       = aws.California
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.California_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.California.id
}

resource "aws_ec2_transit_gateway_route_table_association" "California_vpc_association" {
  provider                       = aws.California
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.California_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.California.id
}

# New York Transit Gateway Route Table entries
resource "aws_ec2_transit_gateway_route_table" "New-York" {
  provider           = aws.New-York
  transit_gateway_id = aws_ec2_transit_gateway.New_York_TGW.id

  tags = {
    Name = "New-York-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route" "New-York_local_vpc_route" {
  provider                       = aws.New-York
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.New-York.id
  destination_cidr_block         = aws_vpc.TMMC-New-York.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.New-York_vpc_attachment.id
}

resource "aws_ec2_transit_gateway_route" "New-York_to_tokyo_route" {
  provider                       = aws.New-York
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.New-York_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.New-York.id
}

resource "aws_ec2_transit_gateway_route_table_association" "New-York_peering_association" {
  provider                       = aws.New-York
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.New-York_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.New-York.id
}

resource "aws_ec2_transit_gateway_route_table_association" "New-York_vpc_association" {
  provider                       = aws.New-York
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.New-York_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.New-York.id
}

# Sao Paulo Transit Gateway Route Table entries
resource "aws_ec2_transit_gateway_route_table" "Sao-Paulo" {
  provider           = aws.Sao-Paulo
  transit_gateway_id = aws_ec2_transit_gateway.Sao_Paulo_TGW.id

  tags = {
    Name = "Sao-Paulo-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route" "Sao-Paulo_local_vpc_route" {
  provider                       = aws.Sao-Paulo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Sao-Paulo.id
  destination_cidr_block         = aws_vpc.TMMC-Sao-Paulo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.Sao-Paulo_vpc_attachment.id
}

resource "aws_ec2_transit_gateway_route" "Sao-Paulo_to_tokyo_route" {
  provider                       = aws.Sao-Paulo
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Sao-Paulo_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Sao-Paulo.id
}

resource "aws_ec2_transit_gateway_route_table_association" "Sao-Paulo_peering_association" {
  provider                       = awsSao-Paulo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Sao-Paulo_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Sao-Paulo.id
}

resource "aws_ec2_transit_gateway_route_table_association" "Sao-Paulo_vpc_association" {
  provider                       = aws.Sao-Paulo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.Sao-Paulo_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.Sao-Paulo.id
}