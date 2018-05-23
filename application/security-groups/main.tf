provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_security_group" "https_allow" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
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
      terraform = "true"
    },
  ]
}
