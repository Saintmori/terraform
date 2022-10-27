resource "aws_instance" "class_task_instance" {
  ami                         = data.aws_ami.amazon_linux_2.image_id
  instance_type               = var.env == "dev" ? var.dev_instance_type : var.qa_instance_type
  subnet_id                   = aws_subnet.public_subnet[0].id
  vpc_security_group_ids      = [aws_security_group.class_task_instance_sg.id]
  user_data                   = data.template_file.user_data.rendered
  key_name                    = aws_key_pair.Bastion_key.key_name
  associate_public_ip_address = var.env == "dev" ? true : false
  tags                        = merge(local.common_tags, { Name = replace(local.name, "rtype", "Bastion") })
}