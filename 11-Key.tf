#TOKYO TOKYO TOKYO
resource "tls_private_key" "Key-Tokyo" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "Key-Tokyo" {
  private_key_pem = tls_private_key.Key-Tokyo.private_key_pem
}

output "private_key"  {
  value     = tls_private_key.Key-Tokyo.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.Key-Tokyo.public_key_openssh
}

#HONG KONG   HONG KONG   HONG KONG
resource "tls_private_key" "Key-Hong-Kong" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "Key-Hong-Kong" {
  private_key_pem = tls_private_key.Key-Hong-Kong.private_key_pem
}

output "private_key" {
  value     = tls_private_key.Key-Hong-Kong.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.Key-Hong-Kong.public_key_openssh
}

#LONDON   LONDON   LONDON
resource "tls_private_key" "Key-London" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "Key-London" {
  private_key_pem = tls_private_key.Key-London.private_key_pem
}

output "private_key" {
  value     = tls_private_key.Key-London.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.Key-London.public_key_openssh
}

#SAO PUALO   SAO PUALO   SAO PUALO
resource "tls_private_key" "Key-Sao-Paulo" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "Key-Sao-Paulo" {
  private_key_pem = tls_private_key.Key-Sao-Paulo.private_key_pem
}

output "private_key" {
  value     = tls_private_key.Key-Sao-Paulo.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.Key-Sao-Paulo.public_key_openssh
}

#CALIFORNIA   CALIFORNIA   CALIFORNIA
resource "tls_private_key" "Key-California" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "Key-California" {
  private_key_pem = tls_private_key.Key-California.private_key_pem
}

output "private_key" {
  value     = tls_private_key.Key-California.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.Key-California.public_key_openssh
}

#AUSTRALIA   AUSTRALIA   AUSTRALIA
resource "tls_private_key" "Key-Australia" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "Key-Australia" {
  private_key_pem = tls_private_key.Key-Australia.private_key_pem
}

output "private_key" {
  value     = tls_private_key.Key-Australia.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.Key-Australia.public_key_openssh
}

#NEW YORK   NEW YORK   NEW YORK
resource "tls_private_key" "Key-New-York" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "Key-New-York" {
  private_key_pem = tls_private_key.Key-New-York.private_key_pem
}

output "private_key" {
  value     = tls_private_key.Key-New-York.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.Key-New-York.public_key_openssh
}