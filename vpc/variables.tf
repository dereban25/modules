variable "vpc_cidr_block" {
  default = "10.16.0.0/16"
}
variable "name_cidr"{
  default = "eks-cluster"
}
variable "name_subnet"{
  default = "eks-cluster-subnet-public"
}
variable "subnet_cidr"{
  default = ["10.16.1.0/24","10.16.2.0/24"]
}
