resource "aws_lb_target_group" "alb_target_group" {
  name     = "class-task-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.class_task.id
}
resource "aws_lb_target_group_attachment" "instance1_attachment" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.class_task_private_instance1.id
  port = 80
}
resource "aws_lb_target_group_attachment" "instance2_attachment" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.class_task_private_instance2.id
  port = 80
}
resource "aws_lb_target_group_attachment" "instance3_attachment" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.class_task_private_instance3.id
  port = 80
}