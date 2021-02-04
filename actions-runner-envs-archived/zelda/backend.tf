terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-jonico"
    key = "aws-github-runner-zelda/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks-jonico"
    encrypt = true
  }
}
