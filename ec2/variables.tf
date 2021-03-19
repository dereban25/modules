variable "type_instance" {
  type = string
  default = "t2.micro"
}
variable "ami_id" {
  default = "ami-098f16afa9edf40be"
}
variable "key_pair_name" {
  default = "N.Virginia"
}
variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  default     = "test"
}
variable "subnet_id" {
//  type = list
//  default = ""
}
variable "public_ip_address" {
  type = bool
  default = true
}
variable "name_instance" {
  type = string
  default = "Created by Terraform modules"
}
variable "count_server"{
  type = number
  default = 3

}
variable "vpc_id"{
  type = string
  default = ""
}