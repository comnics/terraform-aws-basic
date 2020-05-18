output "comnic-subnet-c-id" {
  value = "${aws_subnet.comnic-subnet-c.id}"
}
 
output "comnic-sg-id" {
  value = "${aws_security_group.comnic-sg.id}"
}
