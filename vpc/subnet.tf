resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.class_task.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.class_task.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "public_subnet2"
  }
}
resource "aws_subnet" "public_subnet3" {
  vpc_id     = aws_vpc.class_task.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public_subnet3"
  }
}
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.class_task.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_subnet1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.class_task.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet2"
  }
}
resource "aws_subnet" "private_subnet3" {
  vpc_id     = aws_vpc.class_task.id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private_subnet3"
  }
}