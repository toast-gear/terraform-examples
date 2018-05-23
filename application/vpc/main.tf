provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

# Get the AZs for the region specified
data "aws_availability_zones" "azs" {}

resource "aws_vpc" "main" {
  cidr_block       = "${var.aws_vpc_address_space}"
  instance_tenancy = "default"

  tags = [
    {
      environment = "${var.aws_tag_environment}"
    },
    {
      product = "${var.aws_tag_product}"
    },
    {
      terraform = "true"
    },
  ]
}

resource "aws_subnet" "public_subnets" {
  count                   = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(var.aws_public_subnet_address_space, count.index)}"
  availability_zone       = "${element(data.aws_availability_zones.azs.names, count.index)}"
  map_public_ip_on_launch = true

  tags = [
    {
      environment = "${var.aws_tag_environment}"
    },
    {
      product = "${var.aws_tag_product}"
    },
    {
      terraform = "true"
    },
  ]
}

resource "aws_subnet" "private_subnets" {
  count                   = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(var.aws_private_subnet_address_space, count.index)}"
  availability_zone       = "${element(data.aws_availability_zones.azs.names, count.index)}"
  map_public_ip_on_launch = false

  tags = [
    {
      environment = "${var.aws_tag_environment}"
    },
    {
      product = "${var.aws_tag_product}"
    },
    {
      terraform = "true"
    },
  ]
}
