provider "aws" {
  region = var.aws_region
}

module "security_group" {
  source = "./modules/security_group"
  name = var.sg_name
  description = var.sg_description
  ingress_rules = var.ingress_rules
  tags = var.tags
}


