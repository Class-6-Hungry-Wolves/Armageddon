# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "TMMC-Tokyo" {
  cidr_block = "10.80.0.0/16"

  tags = {
    Name = "Hungry Wolves"
    Service = "J-Teledoctor"
    Owner = "Chewbacca"
    Planet = "Mustafar"
  }
}
