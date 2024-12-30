#TOKYO TOKYO TOKYO
resource "tls_private_key" "Key-Tokyo" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-Tokyo" {
  provider   = aws.Tokyo
  key_name   = "Key-Tokyo"
  public_key = tls_private_key.Key-Tokyo.public_key_openssh
}

output "tokyo_private_key" {
  value     = tls_private_key.Key-Tokyo.private_key_pem
  sensitive = true
}

#HONG KONG HONG KONG HONG KONG
resource "tls_private_key" "Key-Hong-Kong" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-Hong-Kong" {
  provider   = aws.Hong-Kong
  key_name   = "Key-Hong-Kong"
  public_key = tls_private_key.Key-Hong-Kong.public_key_openssh
}

output "hong_kong_private_key" {
  value     = tls_private_key.Key-Hong-Kong.private_key_pem
  sensitive = true
}

#LONDON LONDON LONDON
resource "tls_private_key" "Key-London" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-London" {
  provider   = aws.London
  key_name   = "Key-London"
  public_key = tls_private_key.Key-London.public_key_openssh
}

output "london_private_key" {
  value     = tls_private_key.Key-London.private_key_pem
  sensitive = true
}

#SAO PAULO SAO PAULO SAO PAULO
resource "tls_private_key" "Key-Sao-Paulo" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-Sao-Paulo" {
  provider   = aws.Sao-Paulo
  key_name   = "Key-Sao-Paulo"
  public_key = tls_private_key.Key-Sao-Paulo.public_key_openssh
}

output "sao_paulo_private_key" {
  value     = tls_private_key.Key-Sao-Paulo.private_key_pem
  sensitive = true
}

#CALIFORNIA CALIFORNIA CALIFORNIA
resource "tls_private_key" "Key-California" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-California" {
  provider   = aws.California
  key_name   = "Key-California"
  public_key = tls_private_key.Key-California.public_key_openssh
}

output "california_private_key" {
  value     = tls_private_key.Key-California.private_key_pem
  sensitive = true
}

#AUSTRALIA AUSTRALIA AUSTRALIA
resource "tls_private_key" "Key-Australia" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-Australia" {
  provider   = aws.Australia
  key_name   = "Key-Australia"
  public_key = tls_private_key.Key-Australia.public_key_openssh
}

output "australia_private_key" {
  value     = tls_private_key.Key-Australia.private_key_pem
  sensitive = true
}

#NEW YORK NEW YORK NEW YORK
resource "tls_private_key" "Key-New-York" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-New-York" {
  provider   = aws.New-York
  key_name   = "Key-New-York"
  public_key = tls_private_key.Key-New-York.public_key_openssh
}

output "new_york_private_key" {
  value     = tls_private_key.Key-New-York.private_key_pem
  sensitive = true
}

# Syslog test instance
resource "tls_private_key" "Key-syslog" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "Key-syslog" {
  provider   = aws.Tokyo
  key_name   = "Key-syslog"
  public_key = tls_private_key.Key-syslog.public_key_openssh
}

output "syslog_private_key" {
  value     = tls_private_key.Key-syslog.private_key_pem
  sensitive = true
}

