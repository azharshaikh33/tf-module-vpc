resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    gateway_id = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name = "roboshop-${var.ENV}public-rt"
  }
}

resource "aws_route_table_association" "public-rt-association" {
  count          = length(aws_subnet.PUBLIC_SUBNET.*.id)

  subnet_id      = element(aws_subnet.PUBLIC_SUBNET.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

# private route table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  }

  tags = {
    Name = "roboshop-${var.ENV}private-rt"
  }
}

resource "aws_route_table_association" "private-rt-association" {
  count          = length(aws_subnet.PRIVATE_SUBNET.*.id)

  subnet_id      = element(aws_subnet.PRIVATE_SUBNET.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}