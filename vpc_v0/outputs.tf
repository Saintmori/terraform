output "load_balancer_dns_name" {
    value = aws_lb.class_task_lb.dns_name   # Refrence
    description = "This is the dns_name of the load balancer"
}