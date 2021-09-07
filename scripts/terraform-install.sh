sudo apt update && sudo apt upgrade -y
sudo apt install -y unzip wget
wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
unzip terraform_*_linux_*.zip -y
sudo mv terraform /usr/local/bin
rm terraform_*_linux_*.zip
terraform --version
