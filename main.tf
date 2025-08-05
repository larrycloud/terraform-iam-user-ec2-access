provider "aws" {
  region = "us-east-1" 
}

resource "aws_iam_user" "ian" {
  name = "Ian"
  tags = {
    Owner = "Portafolio Profesional"
  }
}

resource "aws_iam_group" "ec2_users" {
  name = "EC2Users"
}

resource "aws_iam_group_policy_attachment" "ec2_group_policy" {
  group      = aws_iam_group.ec2_users.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_user_group_membership" "ian_membership" {
  user   = aws_iam_user.ian.name
  groups = [aws_iam_group.ec2_users.name]
}
