output "public_instance_private_ip" {
  value       = aws_instance.class_task_instance.public_ip # Refrence
  description = "this is the ip address of the instance"
}