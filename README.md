# Terraform test
An example of a terraform api deployment using swagger

# Install terraform
Go to [here](https://www.terraform.io/intro/getting-started/install.html) for instructions on how to install terraform.
# Deployment
To deploy run
`terraform deploy` and to undeploy run `terraform destroy`.
# Deployment graph
To see the deployment graph run `terraform graph | dot -Goverlap=false | display`, this requires graphviz to be
installed.