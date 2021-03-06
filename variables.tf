variable "region" {
  default = "eu-west-1"
}

provider "aws" {
    profile = "default"
    region = "${var.region}"
}

variable "disambiguation_suffix" {
  description = "The disambiguation suffix for this user"
}

// this will fetch our account_id, no need to hard code it
data "aws_caller_identity" "current" {}
