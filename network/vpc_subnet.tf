#vpc
resource "aws_vpc" "nolazo-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "nolazo-vpc"
  }
}

#subnet
resource "aws_subnet" "nolazo-subnet-c" {
  vpc_id = aws_vpc.nolazo-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
}
