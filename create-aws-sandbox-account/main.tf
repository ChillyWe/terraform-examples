terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73"
    }
  }
  required_version = ">= 1.9.5"
}

provider "aws" {
  region = "eu-north-1"
  # Use the root account or an account with permissions to create IAM users
}

resource "aws_iam_user" "terraform_admin" {
  name = "terraform-admin"
}

resource "aws_iam_user_policy" "terraform_admin_policy" {
  name = "terraform-admin-policy"
  user = aws_iam_user.terraform_admin.name

  policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:CreateUser",
        "iam:GetUser",
        "iam:GetUserPolicy",
        "iam:AttachUserPolicy",
        "iam:ListAccessKeys",
        "iam:CreateAccessKey",
        "iam:ListUserPolicies",
        "iam:DeleteAccessKey",
        "iam:DeleteUserPolicy",
        "iam:PutUserPolicy",
        "organizations:CreateAccount",
        "organizations:DescribeAccount",
        "organizations:DescribeOrganization",
        "organizations:ListAccounts",
        "ec2:*",
        "s3:*",
        "rds:*",
        "lambda:*",
        "cloudformation:*",
        "cloudwatch:*",
        "logs:*"
      ],
      "Resource": "*"
    }
  ]
})
}

resource "aws_iam_access_key" "terraform_admin_key" {
  user = aws_iam_user.terraform_admin.name
}

output "terraform_admin_access_key" {
  value     = aws_iam_access_key.terraform_admin_key.id
  sensitive = true
}

output "terraform_admin_secret_key" {
  value     = aws_iam_access_key.terraform_admin_key.secret
  sensitive = true
}

# Save credentials to a local file after `terraform apply`
resource "local_file" "terraform_admin_credentials" {
  content = <<EOT
aws_access_key_id = "${aws_iam_access_key.terraform_admin_key.id}"
aws_secret_access_key = "${aws_iam_access_key.terraform_admin_key.secret}"
EOT

  filename = "${path.module}/terraform_admin_credentials.txt"
}