resource "aws_ec2_transit_gateway_vpc_attachment" "hong_kong_vpc_attachment" {
  provider = aws.Hong-Kong
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id = aws_ec2_transit_gateway.Hong_Kong_TGW.id
  vpc_id             = aws_vpc.TMMC-Hong-Kong.id
  subnet_ids         = [aws_subnet.private-ap-east-1a.id, aws_subnet.private-ap-east-1b.id]

  tags = {
    Name = "Hong_Kong_VPC_Attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo_vpc_attachment" {
  provider = aws.Tokyo
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  vpc_id             = aws_vpc.TMMC-Tokyo.id
  subnet_ids         = [aws_subnet.private-ap-northeast-1a.id, aws_subnet.private-ap-northeast-1c.id]

  tags = {
    Name = "Tokyo_VPC_Attachment"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "hong_kong_to_tokyo" {
  provider = aws.Hong-Kong
  transit_gateway_id = aws_ec2_transit_gateway.Hong_Kong_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region = "ap-northeast-1"

  tags = {
    Name = "hong_kong_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_hong_kong_to_tokyo" {
  provider = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.hong_kong_to_tokyo.id

  tags = {
    Name = "accept_hong_kong_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "London_to_tokyo" {
  provider = aws.London
  transit_gateway_id = aws_ec2_transit_gateway.London_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region = "ap-northeast-1"

  tags = {
    Name = "London_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_London_to_tokyo" {
  provider = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.London_to_tokyo.id

  tags = {
    Name = "accept_London_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "Sao-Paulo_to_tokyo" {
  provider = aws.Sao-Paulo
  transit_gateway_id = aws_ec2_transit_gateway.Sao-Paulo_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region = "ap-northeast-1"

  tags = {
    Name = "Sao-Paulo_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_London_to_tokyo" {
  provider = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.London_to_tokyo.id

  tags = {
    Name = "accept_Sao-Paulo_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "California_to_tokyo" {
  provider = aws.California
  transit_gateway_id = aws_ec2_transit_gateway.California_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region = "ap-northeast-1"

  tags = {
    Name = "California_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_California_to_tokyo" {
  provider = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.London_to_tokyo.id

  tags = {
    Name = "accept_California_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "Australia_to_tokyo" {
  provider = aws.Australia
  transit_gateway_id = aws_ec2_transit_gateway.Australia_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region = "ap-northeast-1"

  tags = {
    Name = "Australia_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_Australia_to_tokyo" {
  provider = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.London_to_tokyo.id

  tags = {
    Name = "accept_Australia_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "New-York_to_tokyo" {
  provider = aws.New-York
  transit_gateway_id = aws_ec2_transit_gateway.New-York_TGW.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  peer_region = "ap-northeast-1"

  tags = {
    Name = "New-York_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_New-York_to_tokyo" {
  provider = aws.Tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.London_to_tokyo.id

  tags = {
    Name = "accept_New-York_to_tokyo"
  }
}