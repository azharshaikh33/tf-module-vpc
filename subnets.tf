resource "aws_subnet" "PUBLIC_SUBNET" {
  count = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.PUBLIC_SUBNET_CIDR, count.index)

  tags = {
    Name = "ROBOT_PUBLIC_SUBNET"
  }
}