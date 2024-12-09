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