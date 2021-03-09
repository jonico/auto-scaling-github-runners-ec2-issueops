
locals {
  environment = var.runners_environment
  aws_region  = "eu-west-1"
}

resource "random_password" "random" {
  length = 28
}

module "runners" {
  source  = "philips-labs/github-runner/aws"
  version = "0.12.0"

  aws_region = local.aws_region
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  environment = local.environment
  tags = {
    Project = "octodemo-aws-github-runner-${RUNNER_ENVIRONMENT}"
    Stop = "Never"
    Terminate = "Never"
  }

  github_app = {
    key_base64     = var.github_app_key_base64
    id             = var.github_app_id
    client_id      = var.github_app_client_id
    client_secret  = var.github_app_client_secret
    webhook_secret = random_password.random.result
  }

  webhook_lambda_zip                = "../download-lambdas/webhook.zip"
  runner_binaries_syncer_lambda_zip = "../download-lambdas/runner-binaries-syncer.zip"
  runners_lambda_zip                = "../download-lambdas/runners.zip"

  enable_organization_runners       = true
  runner_extra_labels               = "auto-scale,aws,${RUNNER_ENVIRONMENT}"
  runner_group_name                 = var.runners_group

  # enable access to the runners via SSM
  enable_ssm_on_runners = true

   idle_config = [{
     cron      = "* * * * * *"
     timeZone  = "Europe/Amsterdam"
     idleCount = var.runners_minimum_count
   }]

  # disable KMS and encryption
  # encrypt_secrets = false

  # Let the module manage the service linked role
  create_service_linked_role_spot = true

  # use GitHub Enterprise url if set
  ghes_url = var.github_enterprise_url != "" ? var.github_enterprise_url : null

  instance_type = var.instance_type

  minimum_running_time_in_minutes = var.minimum_running_time_in_minutes

  runners_maximum_count = var.runners_maximum_count

  ami_owners        = [var.runners_ami_owner]

  ami_filter = {
    name = [var.runners_ami_filter]
  }

}
