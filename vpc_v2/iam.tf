resource "aws_iam_policy" "class_task_private_instance_policy" {
  name        = "instance_policy"
  path        = "/"
  description = "This policy is to allow the instance to import the key to AWS."

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:ImportKeyPair",
                "ec2:CreateKeyPair",
                "ec2:ListKeyPair",
            ],
            "Resource": "*"
        }
    ]
})
}
resource "aws_iam_role" "ec2_role" {
  name = "ec2_key_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_policy_attachment" "ec2-attachment" {
  name       = "ec2-attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.class_task_private_instance_policy.arn
}
resource "aws_iam_instance_profile" "instance_profile" {
  name = "class_task_private_instance_profile"
  role = aws_iam_role.ec2_role.name
}
