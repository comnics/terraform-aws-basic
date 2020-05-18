#vpc
resource "aws_vpc" "comnic-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "comnic-vpc"
  }
}

#subnet
resource "aws_subnet" "comnic-subnet-c" {
  vpc_id = aws_vpc.comnic-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
}
