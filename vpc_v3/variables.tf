variable "env" {
  type        = string
  description = "This is a variable for Environment"
  default     = "dev"
}
variable "region" {
  type        = string
  description = "This is a variable for region"
  default     = "ue1"
}
variable "stage" {
  type        = string
  description = "This is a variable for stage"
  default     = "nonprod"
}
variable "project" {
  type        = string
  description = "This is a variable for project"
  default     = "cat"
}
variable "dev_instance_type" {
  type        = string
  description = "This is a variable for instance type"
  default     = "t2.micro"
}
variable "qa_instance_type" {
  type        = string
  description = "This is a variable for qa instance type"
  default     = "t3.micro"
}
variable "dev_vpc_cidr" {
  type        = string
  description = "This is the cider block for the vpc"
  default     = "10.0.0.0/16"
}
variable "qa_vpc_cidr" {
  type        = string
  description = "This is the qa vpc cidr range variable"
  default     = "10.0.0.0/24"
}
variable "public_subnet_ciders" {
  type        = list(string)
  description = "This is the ciders for the public subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "AZs" {
  type        = list(string)
  description = "These are the list of the AZs for the subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "name" {
  type        = list(string)
  description = "these are the names of the public subnets"
  default     = ["class_task_public_subnet1", "class_task_public_subnet2", "class_task_public_subnet3"]
}
variable "private_subnet_ciders" {
  type        = list(string)
  description = "This is the ciders for the private subnet"
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}
variable "private_subnet_name" {
  type        = list(string)
  description = "these are the names of the private subnets"
  default     = ["class_task_private_subnet1", "class_task_private_subnet2", "class_task_private_subnet3"]
}