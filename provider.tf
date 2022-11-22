terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIA535Y2FGVVT3EZQGA"
    secret_key = "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"
}