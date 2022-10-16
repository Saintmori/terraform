output "private_instance_private_ip" {
    value = aws_instance.class_task_private_instance1.private_ip     # Refrence
    description = "this is the ip address of the instance"
}