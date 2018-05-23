variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "aws_region" {
  default = ""
}

variable "aws_tag_product" {
  default = ""
}

variable "aws_tag_environment" {
  default = ""
}

variable "aws_vpc_address_space" {
  default = "10.0.0.0/16"
}

variable "aws_private_subnet_address_space" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "aws_public_subnet_address_space" {
  type    = "list"
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
