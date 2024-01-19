terraform {
  required_version = ">= 1.5, < 2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33"
    }


    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}
