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
  default = ""
}

variable "aws_private_subnet_address_space" {
  type    = "list"
  default = [""]
}

variable "aws_public_subnet_address_space" {
  type    = "list"
  default = [""]
}
