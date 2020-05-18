#Security Group
resource "aws_security_group" "nolazo-sg" {
  vpc_id      = aws_vpc.nolazo-vpc.id
  name        = "nolazo-sg"
  description = "This security group is for NOLAZO"
  tags = { Name = "nolazo-sg" }
}

#SG Rules
resource "aws_security_group_rule" "nolazo-cluster-traffic" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = aws_security_group.nolazo-sg.id
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "instance-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nolazo-sg.id
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "instance-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nolazo-sg.id
  lifecycle { create_before_destroy = true }
}

resource "aws_security_group_rule" "outbound-traffic" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nolazo-sg.id
  lifecycle { create_before_destroy = true }
}
