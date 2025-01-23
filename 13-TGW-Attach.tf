# VPC Attachments
resource "aws_ec2_transit_gateway_vpc_attachment" "hong_kong_vpc_attachment" {
  provider                                        = aws.Hong-Kong
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id                              = aws_ec2_transit_gateway.Hong_Kong_TGW.id
  vpc_id                                          = aws_vpc.TMMC-Hong-Kong.id
  subnet_ids                                      = [aws_subnet.private-ap-east-1a.id, aws_subnet.private-ap-east-1b.id]

  tags = {
    Name = "Hong_Kong_VPC_Attachment"
  }

  depends_on = [
    aws_ec2_transit_gateway.Hong_Kong_TGW,
    aws_vpc.TMMC-Hong-Kong,
    aws_subnet.private-ap-east-1a,
    aws_subnet.private-ap-east-1b
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo_vpc_attachment" {
  provider                                        = aws.Tokyo
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id                              = aws_ec2_transit_gateway.Tokyo_TGW.id
  vpc_id                                          = aws_vpc.TMMC-Tokyo.id
  subnet_ids                                      = [aws_subnet.private-ap-northeast-1a.id, aws_subnet.private-ap-northeast-1c.id, aws_subnet.private-ap-northeast-1d-SYS.id]

  tags = {
    Name = "Tokyo_VPC_Attachment"
  }

  depends_on = [
    aws_ec2_transit_gateway.Tokyo_TGW,
    aws_vpc.TMMC-Tokyo,
    aws_subnet.private-ap-northeast-1a,
    aws_subnet.private-ap-northeast-1c
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "london_vpc_attachment" {
  provider                                        = aws.London
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id                              = aws_ec2_transit_gateway.London_TGW.id
  vpc_id                                          = aws_vpc.TMMC-London.id
  subnet_ids                                      = [aws_subnet.private-eu-west-2a.id, aws_subnet.private-eu-west-2b.id]

  tags = {
    Name = "London_VPC_Attachment"
  }

  depends_on = [
    aws_ec2_transit_gateway.London_TGW,
    aws_vpc.TMMC-London,
    aws_subnet.private-eu-west-2a,
    aws_subnet.private-eu-west-2b
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "sao_paulo_vpc_attachment" {
  provider                                        = aws.Sao-Paulo
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id                              = aws_ec2_transit_gateway.Sao_Paulo_TGW.id
  vpc_id                                          = aws_vpc.TMMC-Sao-Paulo.id
  subnet_ids                                      = [aws_subnet.private-sa-east-1a.id, aws_subnet.private-sa-east-1c.id]

  tags = {
    Name = "Sao_Paulo_VPC_Attachment"
  }

  depends_on = [
    aws_ec2_transit_gateway.Sao_Paulo_TGW,
    aws_vpc.TMMC-Sao-Paulo,
    aws_subnet.private-sa-east-1a,
    aws_subnet.private-sa-east-1c
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "california_vpc_attachment" {
  provider                                        = aws.California
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id                              = aws_ec2_transit_gateway.California_TGW.id
  vpc_id                                          = aws_vpc.TMMC-California.id
  subnet_ids                                      = [aws_subnet.private-us-west-1c.id, aws_subnet.private-us-west-1b.id]

  tags = {
    Name = "California_VPC_Attachment"
  }

  depends_on = [
    aws_ec2_transit_gateway.California_TGW,
    aws_vpc.TMMC-California,
    aws_subnet.private-us-west-1c,
    aws_subnet.private-us-west-1b
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "australia_vpc_attachment" {
  provider                                        = aws.Australia
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id                              = aws_ec2_transit_gateway.Australia_TGW.id
  vpc_id                                          = aws_vpc.TMMC-Australia.id
  subnet_ids                                      = [aws_subnet.private-ap-southeast-2a.id, aws_subnet.private-ap-southeast-2b.id]

  tags = {
    Name = "Australia_VPC_Attachment"
  }

  depends_on = [
    aws_ec2_transit_gateway.Australia_TGW,
    aws_vpc.TMMC-Australia,
    aws_subnet.private-ap-southeast-2a,
    aws_subnet.private-ap-southeast-2b
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "new_york_vpc_attachment" {
  provider                                        = aws.New-York
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id                              = aws_ec2_transit_gateway.New_York_TGW.id
  vpc_id                                          = aws_vpc.TMMC-New-York.id
  subnet_ids                                      = [aws_subnet.private-us-east-1a.id, aws_subnet.private-us-east-1b.id]

  tags = {
    Name = "New_York_VPC_Attachment"
  }

  depends_on = [
    aws_ec2_transit_gateway.New_York_TGW,
    aws_vpc.TMMC-New-York,
    aws_subnet.private-us-east-1a,
    aws_subnet.private-us-east-1b
  ]
}

# Peering Attachments
resource "aws_ec2_transit_gateway_peering_attachment" "hong_kong_to_tokyo" {
  provider                = aws.Hong-Kong
  transit_gateway_id      = aws_ec2_transit_gateway.Hong_Kong_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region             = "ap-northeast-1"

  tags = {
    Name = "hong_kong_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway.Hong_Kong_TGW,
    aws_ec2_transit_gateway.Tokyo_TGW
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_Hong_Kong_to_tokyo" {
  provider                      = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id

  tags = {
    Name = "accept_hong_kong_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment" "London_to_tokyo" {
  provider                = aws.London
  transit_gateway_id      = aws_ec2_transit_gateway.London_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region             = "ap-northeast-1"

  tags = {
    Name = "london_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway.London_TGW,
    aws_ec2_transit_gateway.Tokyo_TGW
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_London_to_tokyo" {
  provider                      = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.London_to_tokyo.id

  tags = {
    Name = "accept_london_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.London_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment" "Sao_Paulo_to_tokyo" {
  provider                = aws.Sao-Paulo
  transit_gateway_id      = aws_ec2_transit_gateway.Sao_Paulo_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region             = "ap-northeast-1"

  tags = {
    Name = "sao_paulo_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway.Sao_Paulo_TGW,
    aws_ec2_transit_gateway.Tokyo_TGW
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_Sao_Paulo_to_tokyo" {
  provider                      = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.Sao_Paulo_to_tokyo.id

  tags = {
    Name = "accept_sao_paulo_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.Sao_Paulo_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment" "California_to_tokyo" {
  provider                = aws.California
  transit_gateway_id      = aws_ec2_transit_gateway.California_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region             = "ap-northeast-1"

  tags = {
    Name = "california_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway.California_TGW,
    aws_ec2_transit_gateway.Tokyo_TGW
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_California_to_tokyo" {
  provider                      = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.California_to_tokyo.id

  tags = {
    Name = "accept_california_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.California_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment" "Australia_to_tokyo" {
  provider                = aws.Australia
  transit_gateway_id      = aws_ec2_transit_gateway.Australia_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region             = "ap-northeast-1"

  tags = {
    Name = "australia_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway.Australia_TGW,
    aws_ec2_transit_gateway.Tokyo_TGW
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_Australia_to_tokyo" {
  provider                      = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.Australia_to_tokyo.id

  tags = {
    Name = "accept_australia_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.Australia_to_tokyo
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment" "New_York_to_tokyo" {
  provider                = aws.New-York
  transit_gateway_id      = aws_ec2_transit_gateway.New_York_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region             = "ap-northeast-1"

  tags = {
    Name = "new_york_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway.New_York_TGW,
    aws_ec2_transit_gateway.Tokyo_TGW
  ]
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_New_York_to_tokyo" {
  provider                      = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.New_York_to_tokyo.id

  tags = {
    Name = "accept_new_york_to_tokyo"
  }

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.New_York_to_tokyo
  ]
}
