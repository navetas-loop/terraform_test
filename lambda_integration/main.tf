resource "random_uuid" "sid" { }

resource "aws_lambda_permission" "allow_api_gateway" {
  function_name = "${var.function_name}"
  statement_id = "${random_uuid.sid.result}"
  action = "lambda:InvokeFunction"
  principal = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.region}:${var.account_id}:${var.gateway_id}/*/${var.http_method}${var.http_path}"
}

resource "aws_lambda_function" "lambda_function" {
  filename = "${var.zip_file}"
  function_name = "${var.function_name}"
  role = "${var.role_arn}"
  handler = "${var.handler}"
  runtime = "python3.6"
  source_code_hash = "${base64sha256(file("${var.zip_file}"))}"
  publish = true
}



