

resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "this is a security group for my bastion host"
  vpc_id      = aws_vpc.class_task.id
}
resource "aws_security_group_rule" "bastion_igress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_sg.id
}
resource "aws_security_group_rule" "bastion_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_sg.id
}
resource "aws_security_group" "private_instance_sg" {
  name        = "private_instance_sg"
  description = "this is a security group for my private instance"
  vpc_id      = aws_vpc.class_task.id
}
resource "aws_security_group_rule" "private_instance_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22 
  protocol          = "tcp"
  source_security_group_id = aws_security_group.bastion_sg.id
  security_group_id = aws_security_group.private_instance_sg.id
}
resource "aws_security_group_rule" "private_instance_ingress2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_instance_sg.id
}
resource "aws_security_group_rule" "private_instance_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_instance_sg.id
}
resource "aws_security_group" "class_task_lb_sg" {
  name        = "lb_sg"
  description = "this is a security group for my application load balancer"
  vpc_id      = aws_vpc.class_task.id
}
resource "aws_security_group_rule" "load_balancer_igress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.class_task_lb_sg.id
}
  resource "aws_security_group_rule" "load_balancer_igress2" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.class_task_lb_sg.id
}
resource "aws_security_group_rule" "load_balancer_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.class_task_lb_sg.id
}