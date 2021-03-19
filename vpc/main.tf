resource "aws_vpc" "eks" {
  cidr_block       = var.vpc_cidr_block
  tags = {
    Name = var.name_cidr
  }
}
data "aws_availability_zones" "zone_for_subnet" {}
resource "aws_subnet" "subnet_public_eks" {
  count             = length(var.subnet_cidr)
  cidr_block        = var.subnet_cidr[count.index]
  vpc_id            = aws_vpc.eks.id
  availability_zone = data.aws_availability_zones.zone_for_subnet.names[count.index]
  tags = {
    Name = "EKS ${var.name_subnet} ${data.aws_availability_zones.zone_for_subnet.names[count.index]}"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.eks.id
  tags = {
    Name = "Gateway VPC"
  }
}
resource "aws_route" "igw-route" {
  route_table_id = aws_vpc.eks.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
  depends_on = [
    "aws_internet_gateway.gw"
  ]
}
//resource "aws_eip" "web_server_eip" {
//  count = 1
//  vpc        = true
////  instance   = aws_instance.dwd[count.index].id
//  depends_on = ["aws_internet_gateway.gw"]
//  tags       = { Name = "DWD" }
//}
output "aws_subnet" {
  value = aws_subnet.subnet_public_eks[*].id
}


