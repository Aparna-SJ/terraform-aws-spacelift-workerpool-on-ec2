terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<5.0"
    }

    random = { source = "hashicorp/random" }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_vpc" "this" {
  default = true
}

data "aws_security_group" "this" {
  name   = "default"
  vpc_id = data.aws_vpc.this.id
}

data "aws_subnets" "this" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
}

resource "random_pet" "this" {}

#### Spacelift worker pool ####

module "this" {
  source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=v1.5.0"

  configuration   = <<-EOT
    export SPACELIFT_TOKEN=""${var.worker_pool_config}""
    export SPACELIFT_POOL_PRIVATE_KEY="${var.worker_pool_private_key}"
  EOT
  security_groups = var.worker_pool_security_groups
  vpc_subnets     = var.worker_pool_subnets
  worker_pool_id  = var.worker_pool_id
}
