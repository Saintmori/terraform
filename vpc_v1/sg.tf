resource "aws_security_group" "class_task_instance_sg" {
  name        = "${var.env}_class_task_instance_sg"
  description = "this is a security group for my instance"
  vpc_id      = aws_vpc.vpc.id
}
resource "aws_security_group_rule" "class_task_instance_sg_ingress22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.class_task_instance_sg.id
}
resource "aws_security_group_rule" "class_task_instance_sg_ingress80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.class_task_instance_sg.id
}
resource "aws_security_group_rule" "class_task_instance_sg_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.class_task_instance_sg.id
}