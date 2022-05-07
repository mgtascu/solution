terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "3.3.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = var.region
  profile = var.profile
}