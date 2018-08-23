# Terraform test
An example of a terraform api deployment using swagger

# Install terraform
Go to [here](https://www.terraform.io/intro/getting-started/install.html) for instructions on how to install terraform.
# Setup
To setup run `terraform init`.
# Deployment
To deploy run
`terraform apply -var disambiguation_suffix=$USER` and to undeploy run `terraform destroy`.
# Deployment graph
To see the deployment graph run `terraform graph | dot -Goverlap=false | display`, this requires graphviz to be
installed.