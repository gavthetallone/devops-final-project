#sudo apt update && sudo apt upgrade -y
#sudo apt install -y unzip wget
#wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
#unzip terraform_*_linux_*.zip -y
#sudo mv terraform /usr/local/bin
#rm terraform_*_linux_*.zip
#terraform --version


sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
