resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "${var.env}-class_task_vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-class_task_ig"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.env}-class_task_public_route_table"
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_ciders)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_subnet_ciders, count.index)
  availability_zone = element(var.AZs, count.index)

  tags = {
    Name = "${var.env}_public_subnet_${count.index}"
  }
}

resource "aws_route_table_association" "pubic_subnets" {
  count          = length(var.AZs)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.public_route_table.*.id, count.index)
}

resource "aws_eip" "class_task_elastic_ip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.class_task_elastic_ip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "${var.env}_class_task_nat_gateway"
  }

  depends_on = [aws_internet_gateway.gw]
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-class_task_private_route_table"
  }
}
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.AZs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnet_ciders, count.index)
  availability_zone = element(var.AZs, count.index)

  tags = {
    Name = "${var.env}_private_subnet_${count.index}"
  }
}

resource "aws_route_table_association" "private_subnets" {
  count          = length(var.AZs)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private_route_table.*.id, count.index)
}