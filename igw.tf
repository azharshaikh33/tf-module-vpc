resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-${var.ENV}-igw"
  }
}

resource "aws_eip" "ngw_ip" {
    domain = "vpc"

    tags = {
        Name = "roboshop-${var.ENV}-ngw_eip"
    }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_ip.id
  subnet_id     = aws_subnet.PUBLIC_SUBNET.*.id[0]

  tags = {
    Name = "roboshop-${var.ENV}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_eip.ngw_ip]
}