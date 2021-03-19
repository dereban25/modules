
resource "aws_instance" "ec2-instance"{

count = var.count_server
  instance_type = var.type_instance
  ami = var.ami_id
  key_name = var.key_pair_name
  subnet_id = var.subnet_id
//  vpc_id = var.vpc_id
  associate_public_ip_address = var.public_ip_address
  tags = {
    Name = var.name_instance
  }
}