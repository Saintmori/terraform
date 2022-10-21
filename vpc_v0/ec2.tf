
resource "aws_instance" "class_task_instance" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name = "macmurtaza"
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  user_data = <<EOF
  #!/bin/bash
  ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
  aws ec2 import-key-pair --key-name "Bastion_key" --public-key-material fileb://~/.ssh/id_rsa.pub --region us-east-1
  EOF
  tags = {
    Name = "Bastion"
  }
}
resource "aws_instance" "class_task_private_instance1" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  key_name = "Bastion_key"
  user_data = <<EOF
#!/bin/bash
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "hello from terraform instance1" > /var/www/html/index.html
EOF

  tags = {
    Name = "private_instance1"
  }
}
resource "aws_instance" "class_task_private_instance2" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  key_name = "Bastion_key"
  user_data = <<EOF
#!/bin/bash
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "hello from terraform instance2" > /var/www/html/index.html
EOF

  tags = {
    Name = "private_instance2"
  }
}

resource "aws_instance" "class_task_private_instance3" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  key_name = "Bastion_key"
  user_data = <<EOF
#!/bin/bash
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "hello from terraform instance3" > /var/www/html/index.html
EOF

  tags = {
    Name = "private_instance3"
  }
}
