module "application" {
  source = "../../application"

  aws_access_key = "${var.aws_access_key}"

  aws_secret_key = "${var.aws_secret_key}"

  aws_region = "${var.aws_region}"

  aws_tag_environment = "${var.aws_tag_environment}"

  aws_tag_product = "${var.aws_tag_product}"
}
