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
        name = "app1-prod-eu-east-1"
    }
  }
}

provider "aws" {
  region  = var.region
}

module "hashicat" {
    source  = "app.terraform.io/r2-org/hashicat/r2"
    version = "0.0.7"
    # insert required variables here
    prefix = "APP1"
    region = var.region
    address_space = "10.0.0.0/16"
    subnet_prefix = "10.0.10.0/24"
    instance_type = "var.instance_type"
    admin_username = "hashicorp"
    height = "400"
    width = "600"
    placeholder = "placebear.com"
}