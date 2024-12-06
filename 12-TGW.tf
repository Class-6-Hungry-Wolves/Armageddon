resource "aws_ec2_transit_gateway" "Tokyo_TGW" {
    provider   = aws.Tokyo
    description = "TGW for Tokyo"
    tags = {
        Name = "TMMC-Tokyo-TGW"
        Service = "J-Teledoctor"
        Owner = "Hungry-Wolves"
        Planet = "Earth"
    }
}

resource "aws_ec2_transit_gateway" "Hong_Kong_TGW" {
    provider   = aws.Hong-Kong
    description = "TGW for Hong Kong"
    tags = {
        Name = "TMMC-Hong-Kong-TGW"
        Service = "J-Teledoctor"
        Owner = "Hungry-Wolves"
        Planet = "Earth"
    }
}

resource "aws_ec2_transit_gateway" "London_TGW" {
    provider   = aws.London
    description = "TGW for London"
    tags = {
        Name = "TMMC-London-TGW"
        Service = "J-Teledoctor"
        Owner = "Hungry-Wolves"
        Planet = "Earth"
    }
}

resource "aws_ec2_transit_gateway" "Sao_Paulo_TGW" {
    provider   = aws.Sao-Paulo
    description = "TGW for Sao Paulo"
    tags = {
        Name = "TMMC-Sao-Paulo-TGW"
        Service = "J-Teledoctor"
        Owner = "Hungry-Wolves"
        Planet = "Earth"
    }
}

resource "aws_ec2_transit_gateway" "California_TGW" {
    provider   = aws.California
    description = "TGW for California"
    tags = {
        Name = "TMMC-California-TGW"
        Service = "J-Teledoctor"
        Owner = "Hungry-Wolves"
        Planet = "Earth"
    }
}

resource "aws_ec2_transit_gateway" "Australia_TGW" {
    provider   = aws.Australia
    description = "TGW for Australia"
    tags = {
        Name = "TMMC-Australia-TGW"
        Service = "J-Teledoctor"
        Owner = "Hungry-Wolves"
        Planet = "Earth"
    }
}

resource "aws_ec2_transit_gateway" "New_York_TGW" {
    provider   = aws.New-York
    description = "TGW for New York"
    tags = {
        Name = "TMMC-New-York-TGW"
        Service = "J-Teledoctor"
        Owner = "Hungry-Wolves"
        Planet = "Earth"
    }
}