# Hong Kong Resources
resource "aws_ec2_transit_gateway_route_table" "hong_kong" {
  provider           = aws.Hong-Kong
  transit_gateway_id = aws_ec2_transit_gateway.Hong_Kong_TGW.id

  tags = {
    Name = "Hong-Kong-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "hong_kong_vpc_association" {
  provider                       = aws.Hong-Kong
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hong_kong_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.hong_kong_vpc_attachment
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "hong_kong_peering_association" {
  provider                       = aws.Hong-Kong
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route" "hong_kong_local_vpc_route" {
  provider                       = aws.Hong-Kong
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id
  destination_cidr_block         = aws_vpc.TMMC-Hong-Kong.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hong_kong_vpc_attachment.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.hong_kong_vpc_association
  ]
}

resource "aws_ec2_transit_gateway_route" "hong_kong_to_tokyo_route" {
  provider                       = aws.Hong-Kong
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hong_kong.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.hong_kong_peering_association
  ]
}

# Tokyo Resources
resource "aws_ec2_transit_gateway_route_table" "tokyo" {
  provider           = aws.Tokyo
  transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id

  tags = {
    Name = "Tokyo-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_vpc_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.tokyo_vpc_attachment
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_hong_kong_peering_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_london_peering_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.london_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.london_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_sao_paulo_peering_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.sao_paulo_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.sao_paulo_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_california_peering_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.california_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.california_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_australia_peering_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.australia_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.australia_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_new_york_peering_association" {
  provider                       = aws.Tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.new_york_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.new_york_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route" "tokyo_local_vpc_route" {
  provider                       = aws.Tokyo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo_vpc_attachment.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.tokyo_vpc_association
  ]
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_hong_kong_route" {
  provider                       = aws.Tokyo
  destination_cidr_block         = aws_vpc.TMMC-Hong-Kong.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.tokyo_hong_kong_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_london_route" {
  provider                       = aws.Tokyo
  destination_cidr_block         = aws_vpc.TMMC-London.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.London_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.tokyo_london_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_sao_paulo_route" {
  provider                       = aws.Tokyo
  destination_cidr_block         = aws_vpc.TMMC-Sao-Paulo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Sao_Paulo_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.tokyo_sao_paulo_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_california_route" {
  provider                       = aws.Tokyo
  destination_cidr_block         = aws_vpc.TMMC-California.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.California_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.tokyo_california_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_australia_route" {
  provider                       = aws.Tokyo
  destination_cidr_block         = aws_vpc.TMMC-Australia.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Australia_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.tokyo_australia_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_new_york_route" {
  provider                       = aws.Tokyo
  destination_cidr_block         = aws_vpc.TMMC-New-York.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.New_York_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.tokyo_new_york_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route_table" "london" {
  provider           = aws.London
  transit_gateway_id = aws_ec2_transit_gateway.London_TGW.id

  tags = {
    Name = "London-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "london_vpc_association" {
  provider                       = aws.London
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.london_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.london_vpc_attachment
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "london_peering_association" {
  provider                       = aws.London
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.london_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.london_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route" "london_local_vpc_route" {
  provider                       = aws.London
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london.id
  destination_cidr_block         = aws_vpc.TMMC-London.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.london_vpc_attachment.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.london_vpc_association
  ]
}

resource "aws_ec2_transit_gateway_route" "london_to_tokyo_route" {
  provider                       = aws.London
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.london_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.london_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route_table" "sao_paulo" {
  provider           = aws.Sao-Paulo
  transit_gateway_id = aws_ec2_transit_gateway.Sao_Paulo_TGW.id

  tags = {
    Name = "Sao-Paulo-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "sao_paulo_vpc_association" {
  provider                       = aws.Sao-Paulo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.sao_paulo_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.sao_paulo.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.sao_paulo_vpc_attachment
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "sao_paulo_peering_association" {
  provider                       = aws.Sao-Paulo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Sao_Paulo_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.sao_paulo.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.Sao_Paulo_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route" "sao_paulo_local_vpc_route" {
  provider                       = aws.Sao-Paulo
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.sao_paulo.id
  destination_cidr_block         = aws_vpc.TMMC-Sao-Paulo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.sao_paulo_vpc_attachment.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.sao_paulo_vpc_association
  ]
}

resource "aws_ec2_transit_gateway_route" "sao_paulo_to_tokyo_route" {
  provider                       = aws.Sao-Paulo
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Sao_Paulo_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.sao_paulo.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.sao_paulo_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route_table" "california" {
  provider           = aws.California
  transit_gateway_id = aws_ec2_transit_gateway.California_TGW.id

  tags = {
    Name = "California-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "california_vpc_association" {
  provider                       = aws.California
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.california_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.california.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.california_vpc_attachment
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "california_peering_association" {
  provider                       = aws.California
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.California_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.california.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.California_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route" "california_local_vpc_route" {
  provider                       = aws.California
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.california.id
  destination_cidr_block         = aws_vpc.TMMC-California.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.california_vpc_attachment.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.california_vpc_association
  ]
}

resource "aws_ec2_transit_gateway_route" "california_to_tokyo_route" {
  provider                       = aws.California
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.California_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.california.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.california_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route_table" "australia" {
  provider           = aws.Australia
  transit_gateway_id = aws_ec2_transit_gateway.Australia_TGW.id

  tags = {
    Name = "Australia-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "australia_vpc_association" {
  provider                       = aws.Australia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.australia_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.australia_vpc_attachment
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "australia_peering_association" {
  provider                       = aws.Australia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Australia_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.Australia_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route" "australia_local_vpc_route" {
  provider                       = aws.Australia
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia.id
  destination_cidr_block         = aws_vpc.TMMC-Australia.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.australia_vpc_attachment.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.australia_vpc_association
  ]
}

resource "aws_ec2_transit_gateway_route" "australia_to_tokyo_route" {
  provider                       = aws.Australia
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.Australia_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.australia_peering_association
  ]
}

resource "aws_ec2_transit_gateway_route_table" "new_york" {
  provider           = aws.New-York
  transit_gateway_id = aws_ec2_transit_gateway.New_York_TGW.id

  tags = {
    Name = "New-York-TGW-RTB"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "new_york_vpc_association" {
  provider                       = aws.New-York
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.new_york_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.new_york_vpc_attachment
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "new_york_peering_association" {
  provider                       = aws.New-York
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.New_York_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.New_York_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_route" "new_york_local_vpc_route" {
  provider                       = aws.New-York
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york.id
  destination_cidr_block         = aws_vpc.TMMC-New-York.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.new_york_vpc_attachment.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.new_york_vpc_association
  ]
}

resource "aws_ec2_transit_gateway_route" "new_york_to_tokyo_route" {
  provider                       = aws.New-York
  destination_cidr_block         = aws_vpc.TMMC-Tokyo.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.New_York_to_tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york.id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.new_york_peering_association
  ]
}
