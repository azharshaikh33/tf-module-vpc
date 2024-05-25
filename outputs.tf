output "VPC_ID" {
  value = aws_vpc.main.id
}

output "VPC_CIDR" {
  value = aws_vpc.main.cidr_block
}

output "PUBLIC_SUBNET_IDS" {
  value = aws_subnet.PUBLIC_SUBNET.*.id
}

output "PRIVATE_SUBNET_IDS" {
  value = aws_subnet.PRIVATE_SUBNET.*.id
}

output "PUBLIC_SUBNET_CIDR" {
  value = aws_subnet.PUBLIC_SUBNET.*.cidr_block
}

output "PRIVATE_SUBNET_CIDR" {
  value = aws_subnet.PRIVATE_SUBNET.*.cidr_block
}

output "DEFAULT_VPC_ID" {
  value = var.DEFAULT_VPC_ID
}

output "DEFAULT_VPC_CIDR" {
  value = var.DEFAULT_VPC_CIDR
}

output "PRIVATE_HOSTED_ZONE_ID" {
  value = var.PRIVATE_HOSTED_ZONE_ID
}

output "PRIVATE_HOSTED_ZONE_NAME" {
  value = var.PRIVATE_HOSTED_ZONE_NAME
}

output "PUBLIC_HOSTED_ZONE_ID" {
  value = var.PUBLIC_HOSTED_ZONE_ID
}

output "PUBLIC_HOSTED_ZONE_NAME" {
  value = var.PUBLIC_HOSTED_ZONE_NAME
}


