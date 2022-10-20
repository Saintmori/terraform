resource "aws_nat_gateway" "class_task_nat_gateway" {
  allocation_id = aws_eip.class_task_elastic_ip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "class_task_nat_gateway"
  }

  depends_on = [aws_internet_gateway.class_task_ig]
}