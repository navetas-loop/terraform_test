data "archive_file" "lambda" {
  type        = "zip"
  source_file = "test.py"
  output_path = "lambda.zip"
}

module "api_role" {
  source = "./iam_role"
}

resource "aws_cognito_user_pool" "user_pool" {
  name                = "mypool"
  username_attributes = ["email"]

  schema {
    name                = "name"
    required            = true
    attribute_data_type = "String"
    mutable             = true
  }

  schema {
    name                = "email"
    required            = true
    attribute_data_type = "String"
    mutable             = true
  }

  schema {
    name                = "phone_number"
    required            = false
    attribute_data_type = "String"
    mutable             = true
  }

  schema {
    name                = "address"
    required            = false
    attribute_data_type = "String"
    mutable             = true
  }

  schema {
    name                = "postcode"
    required            = false
    attribute_data_type = "String"
    mutable             = true
  }
}

module "hello_user_lambda" {
  source        = "./lambda_integration"
  account_id    = "${data.aws_caller_identity.current.account_id}"
  gateway_id    = "${aws_api_gateway_rest_api.hello_api.id}"
  zip_file      = "${data.archive_file.lambda.output_path}"
  role_arn      = "${module.api_role.role_arn}"
  http_path     = "/hello/{user}"
  http_method   = "GET"
  function_name = "helloUserLambda"
  handler       = "test.handler"
  region        = "${var.region}"
}

data "template_file" "api_file" {
  template = "${file("api.yml")}"

  vars {
    get_hello_user = "${module.hello_user_lambda.invoke_arn}"
  }
}

resource "aws_api_gateway_rest_api" "hello_api" {
  name        = "Example API"
  description = "Example desc"
  body        = "${data.template_file.api_file.rendered}"
  provisioner "local-exec" {
    command = "echo 'API_RESOURCE_ID=${aws_api_gateway_rest_api.hello_api.id}' > current-deployment.properties"
  }
}
