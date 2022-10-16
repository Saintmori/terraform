resource "aws_vpc" "class_task" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "class_task"
  }
}