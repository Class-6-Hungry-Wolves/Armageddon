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
