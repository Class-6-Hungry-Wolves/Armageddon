# #TOKYO TOKYO TOKYO
# resource "tls_private_key" "Key-Tokyo" {
#   provider   = aws.Tokyo
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "Key-Tokyo" {
#   provider   = aws.Tokyo
#   private_key_pem = tls_private_key.Key-Tokyo.private_key_pem
# }

# output "tokyo_private_key"  {
#   value     = tls_private_key.Key-Tokyo.private_key_pem
#   sensitive = true
# }

# output "tokyo_public_key" {
#   value = data.tls_public_key.Key-Tokyo.public_key_openssh
# }

# #HONG KONG   HONG KONG   HONG KONG
# resource "tls_private_key" "Key-Hong-Kong" {
#   provider   = aws.Hong-Kong
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "Key-Hong-Kong" {
#   provider   = aws.Hong-Kong
#   private_key_pem = tls_private_key.Key-Hong-Kong.private_key_pem
# }

# output "hong_kong_private_key" {
#   value     = tls_private_key.Key-Hong-Kong.private_key_pem
#   sensitive = true
# }

# output "hong_kong_public_key" {
#   value = data.tls_public_key.Key-Hong-Kong.public_key_openssh
# }

# #LONDON   LONDON   LONDON
# resource "tls_private_key" "Key-London" {
#   provider   = aws.London
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "Key-London" {
#   provider   = aws.London
#   private_key_pem = tls_private_key.Key-London.private_key_pem
# }

# output "london_private_key" {
#   value     = tls_private_key.Key-London.private_key_pem
#   sensitive = true
# }

# output "london_public_key" {
#   value = data.tls_public_key.Key-London.public_key_openssh
# }

# #SAO PUALO   SAO PUALO   SAO PUALO
# resource "tls_private_key" "Key-Sao-Paulo" {
#   provider   = aws.Sao-Paulo
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "Key-Sao-Paulo" {
#   provider   = aws.Sao-Paulo
#   private_key_pem = tls_private_key.Key-Sao-Paulo.private_key_pem
# }

# output "sao_paulo_private_key" {
#   value     = tls_private_key.Key-Sao-Paulo.private_key_pem
#   sensitive = true
# }

# output "sao_paulo_public_key" {
#   value = data.tls_public_key.Key-Sao-Paulo.public_key_openssh
# }

# #CALIFORNIA   CALIFORNIA   CALIFORNIA
# resource "tls_private_key" "Key-California" {
#   provider   = aws.California
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "Key-California" {
#   provider   = aws.California
#   private_key_pem = tls_private_key.Key-California.private_key_pem
# }

# output "california_private_key" {
#   value     = tls_private_key.Key-California.private_key_pem
#   sensitive = true
# }

# output "california_public_key" {
#   value = data.tls_public_key.Key-California.public_key_openssh
# }

# #AUSTRALIA   AUSTRALIA   AUSTRALIA
# resource "tls_private_key" "Key-Australia" {
#   provider   = aws.Australia
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "Key-Australia" {
#   provider   = aws.Australia
#   private_key_pem = tls_private_key.Key-Australia.private_key_pem
# }

# output "australia_private_key" {
#   value     = tls_private_key.Key-Australia.private_key_pem
#   sensitive = true
# }

# output "australia_public_key" {
#   value = data.tls_public_key.Key-Australia.public_key_openssh
# }

# #NEW YORK   NEW YORK   NEW YORK
# resource "tls_private_key" "Key-New-York" {
#   provider   = aws.New-York
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# data "tls_public_key" "Key-New-York" {
#   provider   = aws.New-York
#   private_key_pem = tls_private_key.Key-New-York.private_key_pem
# }

# output "new_york_private_key" {
#   value     = tls_private_key.Key-New-York.private_key_pem
#   sensitive = true
# }

# output "new_york_public_key" {
#   value = data.tls_public_key.Key-New-York.public_key_openssh
# }