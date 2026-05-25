terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.7"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "ian" {
  name = var.iam_user_name
  tags = var.tags
}

resource "aws_iam_group" "ec2_users" {
  name = var.iam_group_name
}

data "aws_iam_policy_document" "ec2_limited_access" {
  statement {
    sid    = "AllowReadOnlyEC2Inventory"
    effect = "Allow"

    actions = [
      "ec2:Describe*",
      "ec2:GetConsoleOutput",
      "ec2:GetConsoleScreenshot"
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowStartStopTaggedPortfolioInstances"
    effect = "Allow"

    actions = [
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:RebootInstances"
    ]

    resources = ["arn:aws:ec2:*:*:instance/*"]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/Project"
      values   = [var.project_tag_value]
    }
  }
}

resource "aws_iam_policy" "ec2_limited_access" {
  name        = "${var.iam_group_name}-LimitedEC2Access"
  description = "Least-privilege EC2 access for portfolio-tagged instances."
  policy      = data.aws_iam_policy_document.ec2_limited_access.json
  tags        = var.tags
}

resource "aws_iam_group_policy_attachment" "ec2_group_policy" {
  group      = aws_iam_group.ec2_users.name
  policy_arn = aws_iam_policy.ec2_limited_access.arn
}

resource "aws_iam_user_group_membership" "ian_membership" {
  user   = aws_iam_user.ian.name
  groups = [aws_iam_group.ec2_users.name]
}
