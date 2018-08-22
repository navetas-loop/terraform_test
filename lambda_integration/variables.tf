variable "region" {
  description = "AWS region"
}

variable "account_id" {
  description = "AWS account it"
}

variable "http_method" {
  description = "The method of the endpoint"
}

variable "function_name" {
  description = "The name of the lambda function"
}

variable "role_arn" {
  description = "The role for the lambda"
}

variable "gateway_id" {
  description = "The id of the gateway"
}

variable "handler" {
  description = "The handler of the lambda"
}

variable "zip_file" {
  description = "The zip containing the lambda"
}

variable "http_path" {
  description = "The path for the endpoint"
}
