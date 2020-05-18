variable "key_pair" {
  default = "aws-key"
}

resource "aws_instance" "comnic-server" {
    ami = "ami-01288945bd24ed49a" #amzn2-20200408
    instance_type = "t2.micro"
    subnet_id = module.aws-network-configs.comnic-subnet-c-id
    vpc_security_group_ids = [
        module.aws-network-configs.comnic-sg-id
    ]
    key_name = var.key_pair
    count = 1
    tags = {
        Name = "test-instance"
    }
    associate_public_ip_address = true
}
