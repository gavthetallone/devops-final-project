cd terraform/
terraform init
terraform plan -out=tfplan
terraform apply tfplan
cd .. 