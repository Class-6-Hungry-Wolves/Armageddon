resource "aws_ec2_transit_gateway" "Tokyo_TGW" {
  provider                        = aws.Tokyo
  description                     = "TGW for Tokyo"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name    = "TMMC-Tokyo-TGW"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

resource "aws_ec2_transit_gateway" "Hong_Kong_TGW" {
  provider                        = aws.Hong-Kong
  description                     = "TGW for Hong Kong"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name    = "TMMC-Hong-Kong-TGW"
    Service = "J-Teledoctor"
    Owner   = "Hungry-Wolves"
    Planet  = "Earth"
  }
}

