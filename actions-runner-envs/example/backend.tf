terraform {
  backend "s3" {
    bucket = "terraform-state-jonico"
    key = "aws-github-runner-example/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-locks-jonico"
    encrypt = true
  }
}
