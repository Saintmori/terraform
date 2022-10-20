resource "aws_lb" "class_task_lb" {
  name               = "class-task-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.class_task_lb_sg.id]
  subnets            = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id, aws_subnet.public_subnet3.id]
  

  tags = {
    Environment = "development"
  }
}
resource "aws_lb_listener" "private_subnet_instance" {
  load_balancer_arn = aws_lb.class_task_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}
