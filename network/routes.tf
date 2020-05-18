#routes
resource "aws_internet_gateway" "nolazo-gateway" {
  vpc_id = aws_vpc.nolazo-vpc.id
  tags = {
    Name = "nolazo-gateway"
  }
}

resource "aws_route_table" "nolazo-route-table" {
  vpc_id = aws_vpc.nolazo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nolazo-gateway.id
  }
  tags = {
    Name = "nolazo-route-table"
  }
}

resource "aws_route_table_association" "my-subnet-association" {
  subnet_id      = aws_subnet.nolazo-subnet-c.id
  route_table_id = aws_route_table.nolazo-route-table.id
}
