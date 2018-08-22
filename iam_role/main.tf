resource "random_uuid" "sid_role" { }

resource "aws_iam_role" "api_role" {
  name = "${random_uuid.sid_role.result}"
  assume_role_policy = <<EOF
{
	"Statement": [
		{
		"Effect": "Allow",
		"Principal": {
			"Service": "lambda.amazonaws.com"
		},
		"Action": "sts:AssumeRole"
	}
	]
}
EOF
}

resource "random_uuid" "sid_policy" { }

resource "aws_iam_policy_attachment" "test_attach" {
  name = "${random_uuid.sid_policy.result}"
  roles = ["${aws_iam_role.api_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
