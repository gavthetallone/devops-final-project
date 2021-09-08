cd terraform/
terraform init
terraform plan -out=tfplan -auto-approve
terraform apply tfplan -auto-approve
cd .. 
