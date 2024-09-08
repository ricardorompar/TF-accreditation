terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.65.0"
    }
  }
  cloud {
    organization = "r2-org"
    workspaces {
        name = "app1-${terraform.workspace}-us-east-1"
    }
  }
}

provider "aws" {
  region  = var.region
}

module "hashicat" {
    source  = "app.terraform.io/r2-org/hashicat/r2"
    version = "0.0.7"
    # insert required variables her
    prefix = var.prefix
    region = var.region
    address_space = "10.0.0.0/16"
    subnet_prefix = "10.0.10.0/24"
    instance_type = var.instance_type
    admin_username = "hashicorp"
    height = "500"
    width = "600"
    placeholder = "loremflickr.com"
}