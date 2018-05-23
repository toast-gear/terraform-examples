module "application" {
  source = "../../application"

  aws_access_key                   = "${var.aws_access_key}"
  aws_secret_key                   = "${var.aws_secret_key}"
  aws_region                       = "${var.aws_region}"
  aws_tag_environment              = "${var.aws_tag_environment}"
  aws_tag_product                  = "${var.aws_tag_product}"
  aws_vpc_address_space            = "${var.aws_vpc_address_space}"
  aws_private_subnet_address_space = "${var.aws_private_subnet_address_space}"
  aws_public_subnet_address_space  = "${var.aws_public_subnet_address_space}"
}
