provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_security_group" "rds_rule" {
  name        = "rds-mssql-tcp"
  description = "Allow traffic into MS SQL RDS"

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = [
    {
      environment = "${var.aws_tag_environment}"
    },
    {
      product = "${var.aws_tag_product}"
    },
    {
      type = "rds"
    },
    {
      terraform = "true"
    },
  ]
}

resource "aws_security_group" "http_rule" {
  name        = "http-tcp"
  description = "Allow traffic over port 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = [
    {
      environment = "${var.aws_tag_environment}"
    },
    {
      product = "${var.aws_tag_product}"
    },
    {
      type = "http"
    },
    {
      terraform = "true"
    },
  ]
}

resource "aws_security_group" "https_rule" {
  name        = "https-tcp"
  description = "Allow traffic over port 443"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = [
    {
      environment = "${var.aws_tag_environment}"
    },
    {
      product = "${var.aws_tag_product}"
    },
    {
      type = "https"
    },
    {
      terraform = "true"
    },
  ]
}
