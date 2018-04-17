provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

// VPC

resource "aws_vpc" "main" {
  cidr_block       = "10.0.8.0/21"
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

// SUBNET | PUBLIC

resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.8.0/24"
  availability_zone       = "eu-west-2a"
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

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.9.0/24"
  availability_zone       = "eu-west-2b"
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

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "eu-west-2c"
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

// SUBNET | PRIVATE

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.11.0/24"
  availability_zone = "eu-west-2a"

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

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.12.0/24"
  availability_zone = "eu-west-2b"

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

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.13.0/24"
  availability_zone = "eu-west-2c"

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

// ROUTE TABLES

resource "aws_route_table" "public-subnet" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.environment.id}"
  }

  tags {
    Name        = "${var.vpc["tag"]}-public-subnet-route-table"
    Environment = "${lower(var.vpc["tag"])}"
  }
}

resource "aws_route_table_association" "public-subnet" {
  count          = "${length(split(",", lookup(var.azs, var.provider["region"])))}"
  subnet_id      = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.public-subnet.id}"
}
