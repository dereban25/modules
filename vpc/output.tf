//output "aws_subnet" {
//  value = aws_subnet.subnet_public_eks[*].id
//}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.eks.*.id, [""])[0]
}