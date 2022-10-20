resource "aws_internet_gateway" "class_task_ig" {
  vpc_id = aws_vpc.class_task.id

  tags = {
    Name = "class_task_ig"
  }
}