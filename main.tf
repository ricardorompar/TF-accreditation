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
    version = "0.1.0"
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

#=========== create other instances for demo:
#data for jammy image:
# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }
# #EC2 itself
# resource "aws_instance" "hashicat" {
#   ami                         = data.aws_ami.ubuntu.id
#   instance_type               = var.instance_type

#   for_each = toset([for i in range(4): tostring(i)]) #number of additional instances

#   tags = {
#     Name = "${var.prefix}-hashicat-instance-${each.key}"
#   }
# }