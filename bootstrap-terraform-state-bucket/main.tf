terraform {
  required_version = ">= 0.12, < 0.15"
  #backend "s3" {
  #  bucket = "terraform-state-jonico"
  #  key = "global/s3/terraform.tfstate"
  #  region = "us-east-2"
  #  dynamodb_table = "terraform-locks-jonico"
  #  encrypt = true
  #}
}

provider "aws" {
  region = "us-east-2"

}

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

  lifecycle {
    prevent_destroy= true
  }

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
