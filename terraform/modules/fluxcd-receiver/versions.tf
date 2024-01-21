terraform {
  required_version = ">= 1.5, < 2"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}
