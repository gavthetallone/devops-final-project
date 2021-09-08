curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo az aks install-cli
az login --identity
az aks get-credentials --resource-group petclinic --name petclinic-cluster