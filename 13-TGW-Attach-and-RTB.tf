resource "aws_ec2_transit_gateway_vpc_attachment" "Tokyo_TGW-Attach" {
  provider           = aws.Tokyo
  subnet_ids         = [aws_subnet.private-ap-northeast-1a.id, aws_subnet.private-ap-northeast-1c.id ]
  transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  vpc_id             = aws_vpc.TMMC-Tokyo.id
}


resource "aws_ec2_transit_gateway_vpc_attachment" "Hong_Kong_TGW-Attach" {
  provider           = aws.Hong-Kong
  subnet_ids         = [aws_subnet.private-ap-east-1a.id, aws_subnet.private-ap-east-1b.id ]
  transit_gateway_id = aws_ec2_transit_gateway.Hong_Kong_TGW.id
  vpc_id             = aws_vpc.TMMC-Hong-Kong.id
}

resource "aws_ec2_transit_gateway_peering_attachment" "Hong-Kong_TGW-Tokyo" {
  provider                = aws.Hong-Kong
  peer_region             = "ap-northeast-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  transit_gateway_id      = aws_ec2_transit_gateway.Hong_Kong_TGW.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}
resource "aws_ec2_transit_gateway_vpc_attachment" "London_TGW-Attach" {
  provider           = aws.London
  subnet_ids         = [aws_subnet.private-eu-west-2a.id, aws_subnet.private-eu-west-2b.id ]
  transit_gateway_id = aws_ec2_transit_gateway.London_TGW.id
  vpc_id             = aws_vpc.TMMC-London.id
}

resource "aws_ec2_transit_gateway_peering_attachment" "London_TGW-Tokyo" {
  provider                = aws.London
  peer_region             = "ap-northeast-1"  # Correct Tokyo region
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  transit_gateway_id      = aws_ec2_transit_gateway.London_TGW.id

  tags = {
    Name = "London-Tokyo Peering"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "Sao_Paulo_TGW-Attach" {
  provider           = aws.Sao-Paulo
  subnet_ids         = [aws_subnet.private-sa-east-1a.id, aws_subnet.private-sa-east-1c.id ]
  transit_gateway_id = aws_ec2_transit_gateway.Sao_Paulo_TGW.id
  vpc_id             = aws_vpc.TMMC-Sao-Paulo.id
}

resource "aws_ec2_transit_gateway_peering_attachment" "Sao-Paulo_TGW-Tokyo" {
  provider                = aws.Sao-Paulo
  peer_region             = "ap-northeast-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  transit_gateway_id      = aws_ec2_transit_gateway.Sao_Paulo_TGW.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "California_TGW-Attach" {
  provider           = aws.California
  subnet_ids         = [aws_subnet.private-us-west-1a.id, aws_subnet.private-us-west-1b.id ]
  transit_gateway_id = aws_ec2_transit_gateway.California_TGW.id
  vpc_id             = aws_vpc.TMMC-California.id
}

resource "aws_ec2_transit_gateway_peering_attachment" "California_TGW-Tokyo" {
  provider                = aws.California
  peer_region             = "ap-northeast-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  transit_gateway_id      = aws_ec2_transit_gateway.California_TGW.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "Australia_TGW-Attach" {
  provider           = aws.Australia
  subnet_ids         = [aws_subnet.private-ap-southeast-2a.id, aws_subnet.private-ap-southeast-2b.id ]
  transit_gateway_id = aws_ec2_transit_gateway.Australia_TGW.id
  vpc_id             = aws_vpc.TMMC-Australia.id
}
resource "aws_ec2_transit_gateway_peering_attachment" "Australia_TGW-Tokyo" {
  provider                = aws.Australia
  peer_region             = "ap-northeast-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  transit_gateway_id      = aws_ec2_transit_gateway.Australia_TGW.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "New_York_TGW-Attach" {
  provider           = aws.New-York
  subnet_ids         = [aws_subnet.private-us-east-1a.id, aws_subnet.private-us-east-1b.id ]
  transit_gateway_id = aws_ec2_transit_gateway.New_York_TGW.id
  vpc_id             = aws_vpc.TMMC-New-York.id
}

resource "aws_ec2_transit_gateway_peering_attachment" "New-York_TGW-Tokyo" {
  provider                = aws.New-York
  peer_region             = "ap-northeast-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.Tokyo_TGW.id
  transit_gateway_id      = aws_ec2_transit_gateway.New_York_TGW.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}