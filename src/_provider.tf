terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }
  }
}

provider "aws" {
  region = var.region
  
  # assume_role {
  #   role_arn     = var.oidc_assume_role_arn
  #   session_name = "cafini-github-actions"
  # }
}