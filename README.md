# devops-final-project

## Planning

### Requirements

Plan, design and implement a solution for automating the development workflows and deployments of this application.

What tools will work for you best? For example: Terraform, Kubernetes, Ansible etc. There is no restrictions or requirements on which ones to use; you should decide which you feel are most appropriate and justify their use.

### Tools Used

* Kanban Board: Jira
* Version Control: Git - using the feature-branch model
* CI Server: Jenkins
* Cloud server: Azure
* Reverse Proxy: NGINX
* Terraform
* Docker
* Kubernetes

### Project Requirements

Project Requirements:  
![Project-Requirements](https://raw.githubusercontent.com/gavthetallone/devops-final-project/featureTCFP-34/diagrams/project%20requirements.jpg)

Using Jira we were able to split up all the Issues into smaller workable steps which we slipt up evenly.

### Risk Assessment

Risk Assessment:  
![Initial Risk Assessment](https://raw.githubusercontent.com/gavthetallone/devops-final-project/featureTCFP-34/diagrams/1st%20risk.jpg)

## Continous Deployment and Intergration

### Jenkins Pipline

### Stages

#### Install Terraform

First a check is down to see if terraform is installed or not. If not a install script is run.

#### Install Maven
Making sure maven is installed on the system to run the application and the tests

#### Testing

![Unit Test](https://raw.githubusercontent.com/gavthetallone/devops-final-project/featureTCFP-34/diagrams/tests.jpg)

Using "mvn test" to run the tests which were provided for us, we also where also to produce a cobertura report which showed the coverage of the tests.

![Cobertura Report](https://raw.githubusercontent.com/gavthetallone/devops-final-project/featureTCFP-34/diagrams/cobertura%20report.jpg)

#### Login

Logging into Azure Cloud

#### ACR Login

Using "az acr login" to login into the azure container registries

#### Build and Push Containers

docker building both front and back end of the applicationn then pushing the image to dockerhub.

#### Deploy

Deploying the application using kubernetes and the script "kubectl apply -f ./k8s/" 

### CICD Pipeline Diagram

![Pipeline Diagram]()

### Infrastructure Diagram

![Initial Infrastructure](https://raw.githubusercontent.com/gavthetallone/devops-final-project/featureTCFP-34/diagrams/infrastructurev1.0.png)

![Final Infrastructure](https://raw.githubusercontent.com/gavthetallone/devops-final-project/featureTCFP-34/diagrams/servicesv1.0.png)


### Components in Detail

#### Docker
Docker is a software platform for building applications based on containers and lightweight execution environments that make shared use of the operating system kernel but otherwise run in isolation from one another.

#### Terraform
Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently. 

#### Kubernetes
Kubernetes is an open-source orchestration software for deploying, managing and scaling containers.

#### Nginx
Nginx is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.

#### Nginx Diagram

## Application

### Front End
![Front End](https://raw.githubusercontent.com/gavthetallone/devops-final-project/featureTCFP-34/diagrams/front-end.jpg)
### Back End

### Database

## Testing

### Unit Test

### End-to-End Test

## Improvements

* Stand alone database

## Author 

* Gavin Williams
* Gergely Nemeth
* Mikito Leong
* Pranay Wara

