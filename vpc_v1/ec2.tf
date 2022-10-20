resource "aws_instance" "class_task_instance" {
  ami           = data.aws_ami.amazon_linux_2.image_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.class_task_instance_sg.id]
  user_data = data.template_file.user_data.rendered
  key_name = aws_key_pair.Bastion_key.key_name
  associate_public_ip_address = true
  tags = {
    Name = "${var.env}_Bastion"
  }
}