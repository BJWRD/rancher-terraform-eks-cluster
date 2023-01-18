################################################################################
# versions.tf
################################################################################

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }
    
    backend "s3" {
      bucket = "tfstate-dev-bucket"
      key    = "terraform.tfstate"
      region = "eu-west-2"
    }
    
  }
}
