#routes
resource "aws_internet_gateway" "comnic-gateway" {
  vpc_id = aws_vpc.comnic-vpc.id
  tags = {
    Name = "comnic-gateway"
  }
}

resource "aws_route_table" "comnic-route-table" {
  vpc_id = aws_vpc.comnic-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.comnic-gateway.id
  }
  tags = {
    Name = "comnic-route-table"
  }
}

resource "aws_route_table_association" "my-subnet-association" {
  subnet_id      = aws_subnet.comnic-subnet-c.id
  route_table_id = aws_route_table.comnic-route-table.id
}
