terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
  }
}
    }

terraform {
  cloud {
    organization = "Terraform-Training-2023"
    workspaces {
      name = "terra-house-1"
    }
  }
}


provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length = 32
  special = false
}


resource "aws_s3_bucket" "example" {
  # Bucket naming Rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result
}



output "random_bucket_name" {
  value =random_string.bucket_name.result
}