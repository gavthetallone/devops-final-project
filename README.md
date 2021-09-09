# Devops Final Project

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
![Project-Requirements](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/project%20requirements.jpg)

Using Jira we were able to split up all the Issues into smaller workable steps which we slipt up evenly.

### Risk Assessment

Risk Assessment:  
![Initial Risk Assessment](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/1st%20risk.jpg)

## Continous Deployment and Intergration

### Jenkins Pipline

![Cobertura Report](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/jenkins.jpg)

### Stages

#### Login

Logging into both azure and ACR are the first steps which sets up the rest of the pipeline.

#### Install Terraform

First a check is down to see if terraform is installed or not. If not a install script is run. If terraform is installed then this stage will be skipped.

#### Run Terraform

The terraform files are initialised, then planned and applied. This will build all of the infrastructure for the application to run including:
                            * Resource Group
                            * Vnet
                            * 3 subnets
                            * Jumpbox
                            * Cluster
However if already built then stage will be skipped.

#### Install Maven
Making sure maven is installed on the system to run the application and the tests.

#### Testing

![Unit Test](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/tests.jpg)

Using "mvn test" to run the tests which were provided for us, we also where also to produce a cobertura report which showed the coverage of the tests.

![Cobertura Report](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/cobertura%20report.jpg)

#### Build and Push Containers

Docker building both front and back end of the applicationn then pushing the image to Azure Container Registry.

#### Deploy

Deploying the application using kubernetes and the script "kubectl apply -f ./k8s/" 

### CICD Pipeline Diagram

![Pipeline Diagram](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/pipeline%20diagram2.jpg)

### Infrastructure Diagram

#### Initial
![Initial Infrastructure](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/infrastructurev1.0.png)

#### Final
![Final Infrastructure](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/servicesv1.0.png)


### Components in Detail

#### Azure Container Registry

Azure Container Registry is a private registry service for building, storing, and managing container images and related artifacts. By using Docker commands to push a container image into the registry, and finally pull and run the image from your registry


#### Docker
Docker is a software platform for building applications based on containers and lightweight execution environments that make shared use of the operating system kernel but otherwise run in isolation from one another.

#### Terraform
Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently. 

#### Kubernetes
Kubernetes is an open-source orchestration software for deploying, managing and scaling containers.

#### Nginx
Nginx is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.

## Application

### Front End
![Front End](https://raw.githubusercontent.com/gavthetallone/devops-final-project/dev/diagrams/front-end.jpg)

### Back End
This backend of the Spring Petclinic application only provides a REST API. There is no UI. The application is a Angular front-end application which consumes the REST API. This includes the inbuilt database which will send the information to the load balancer.

## Revisits

### Using a Stand alone database
Switching to a stand alone database meant storing the data outside the application instead of the in the back end. We did it by adding a MySQL edatabase on azure and allowing the backend to communicate to the stand alone database. By following the instructions which are provided in the readme for the backend.



## Author 

* Gavin Williams
* Gergely Nemeth
* Mikito Leong
* Pranay Wara

