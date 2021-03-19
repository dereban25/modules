provider "aws" {
  region = "us-east-1"
}

module "aws_vpc"{
  source = "../modules/vpc"
  vpc_cidr_block = "192.168.0.0/16"
  name_cidr = "ec2-eks"
  name_subnet = "ec2-eks-subnet"
  subnet_cidr = ["192.168.1.0/25"]
}
module "ec2-eks" {
  source = "../modules/ec2"
  ami_id = "ami-098f16afa9edf40be"
  subnet_id = module.aws_vpc.aws_subnet[0]
  count_server = 1
  name_instance = "Centos_MariaDB"
}