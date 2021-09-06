pipeline{

    agent any
    
    stages{
        stage('login'){
            steps{
                sh '''
                    az login --identity
                    '''
            }
        }
        stage('acr login'){
            steps{
                sh'''
                    az acr login --name callistoreg
                    '''
            }
        }
        stage('Build and push containers'){
            steps{
                sh'''
                    docker build -t callistoreg.azurecr.io/spring-petclinic-angular:latest ./spring-petclinic-angular/
                    docker push callistoreg.azurecr.io/spring-petclinic-angular:latest

                    docker build -t callistoreg.azurecr.io/spring-petclinic-rest:latest ./spring-petclinic-rest/
                    docker push callistoreg.azurecr.io/spring-petclinic-rest:latest
                    '''
            }
        }
        stage('deploy'){
            steps{
                sh'''
                    kubectl apply -f ./k8s/
                    '''
            }
        }
    }
}   
