
resource "aws_instance" "class_task_instance" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  tags = {
    Name = "Bastion"
  }
}
resource "aws_instance" "class_task_private_instance1" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  user_data = <<EOF
#!/bin/bash
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "hello from terraform" > /var/www/html/index.html
  EOF

  tags = {
    Name = "private_instance"
  }
}
