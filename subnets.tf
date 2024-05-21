resource "aws_subnet" "PUBLIC_SUBNET" {
  count = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR, count.index)
  availability_zone = element(var.AZ, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "ROBOT_PUBLIC_SUBNET-${element(var.AZ, count.index)}"
  }
}

resource "aws_subnet" "PRIVATE_SUBNET" {
  count = length(var.PRIVATE_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PRIVATE_SUBNET_CIDR, count.index)
  availability_zone = element(var.AZ, count.index)

  tags = {
    Name = "ROBOT_PRIVATE_SUBNET-${element(var.AZ, count.index)}"
  }
}