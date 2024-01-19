terraform {
  required_version = ">= 1.5, < 2"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33"
    }
  }
}
