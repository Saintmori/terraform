![](vpc.jpeg)
# IAAC using Terraform with AWS as the provider.

## Description

### VPC (Virtual Private Cloud)

#### This repository contains a different version of VPC templates, where each VPC provisions the resources for networking such as:
- Three Public and Private subnets
- Internet Gateway
- Nat Gateway
- Public Route Table
- Public Route Table Association
- Private Route Table
- Private Route Table Association
- added some conditions and locals.tf file for names and tagging standards.
### Usage:
- It is used to create a vpc and public/private route tables as well as gw, nat-gateway and an ec2 instance inside the public subnet with a custom index.html file.

### prerequisites
- first make sure you have an AWS account. you can use this link to open an account in AWS.
```
https://portal.aws.amazon.com/billing/signup
```
- git locally installed
- terraform locally installed and AWS credentials are being setup for authentication.

### How to use this code?
```
git clone https://github.com/Saintmori/terraform.git
```
- change the directory to vpc_v1 and run terraform commands.
```
cd vpc_v3
terraform init
terraform plan
terraform apply

```
### contributors
@saintmori

### License
