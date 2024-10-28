# AWS IAM User Setup for Terraform with Limited Permissions

This Terraform example demonstrates how to create an AWS IAM user with specific permissions, enabling it to manage AWS resources without using the root account. This is a recommended best practice to enhance security, especially for automating AWS infrastructure setup and management with tools like Terraform.

## Overview

This configuration:
1. Creates a new IAM user (`terraform-admin`).
2. Attaches a policy to the user with permissions required for AWS Organizations account creation and resource management, including specific IAM, EC2, S3, and RDS actions.
3. Generates access keys for `terraform-admin`, which can be securely stored and used for authentication with AWS CLI or Terraform.

## Usage

Review and Customize the Policy

The policy assigned to terraform-admin in this example provides permissions for:
        Managing IAM users and access keys.
        Working with AWS Organizations.
        Operating various AWS resources (EC2, S3, RDS, Lambda, etc.).

   You can adjust these permissions by editing the aws_iam_user_policy block in main.tf if you want to restrict or expand access.

   Initialize and Apply Terraform Configuration

   Run the following commands to create the IAM user and associated permissions:

```bash
terraform init
terraform plan
terraform apply
```

Access Key and Secret Key: Terraform will output the generated access key and secret key as sensitive outputs. Be sure to store these securely, as they are only shown once.

Configure AWS CLI or Terraform to Use the New IAM User

After running terraform apply, add the following to your AWS credentials file (located at ~/.aws/credentials for Unix-based systems or C:\Users\USERNAME\.aws\credentials for Windows):

```ini
[terraform-admin]
aws_access_key_id = <access-key-id-from-terraform>
aws_secret_access_key = <secret-access-key-from-terraform>
```
This allows terraform-admin to authenticate securely without using the root account.

Using the New User in Terraform

Update the provider block in your other Terraform projects to use this IAM user profile:

```hcl
    provider "aws" {
      region  = "eu-north-1" # Update to your preferred region
      profile = "terraform-admin"
    }
```
Policy Details

The attached policy grants terraform-admin specific permissions to:
    Manage IAM users and roles.
    Perform actions within AWS Organizations, such as creating new accounts.
    Use key AWS services like EC2, S3, Lambda, and CloudFormation.

For enhanced security, always review and tailor IAM policies to fit the specific needs of your project.
Clean-Up

To remove the IAM user and related resources, run:
```bash
terraform destroy
```
>Note: Always review the resources being destroyed to avoid unintended deletions.


