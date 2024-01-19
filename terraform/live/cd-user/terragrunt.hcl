include "root" {
  path = find_in_parent_folders()
}

include "aws" {
  path = find_in_parent_folders("aws.hcl")
}

terraform {
  source = "../../modules/iam-user"
}

inputs = {
  username = "local-kind"
}
