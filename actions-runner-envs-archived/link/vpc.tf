module "vpc" {
  source = "git::https://github.com/jonico/terraform-aws-vpc.git?ref=2.1.1"

  environment                = local.environment
  aws_region                 = local.aws_region
  create_private_hosted_zone = false
}
