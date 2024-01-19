locals {
  aws_profile = "personal"
  aws_region = "ap-southeast-1"
}

generate "aws" {
  path      = "provider_aws.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "aws" {
      profile = "${local.aws_profile}"
      region  = "${local.aws_region}"
    }
  EOF
}
