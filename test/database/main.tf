provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

locals {
  env="${terraform.workspace}"

  counts = {
    "default"=1
    "production"=3
  }

  instances = {
    "default"="t2.micro"
    "production"="t4.large"
  }

  instance_type="${lookup(local.instances,env)}"
  count=${lookup(local.counts,env)}"
}

resource "aws_instance" "my_service" {
  ami="ami-7b4d7900"
  instance_type="${local.instance_type}"
  count="${local.count}"
}