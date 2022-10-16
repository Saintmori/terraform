resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.class_task.id

  tags = {
    Name = "public_route_table"
  }
}
resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.class_task_ig.id
}
