pipeline{

    agent any
    environment{
        ACR_LOGIN_NAME=credentials('ACR_LOGIN_NAME')
        CLUSTER_NAME=credentials('CLUSTER_NAME')
        RG_NAME=credentials('RG_NAME')
        ARM_TENANT_ID=credentials('ARM_TENANT_ID')
        ARM_SUBSCRIPTION_ID=credentials('ARM_SUBSCRIPTION_ID')
        }
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
                    az acr login --name ${ACR_LOGIN_NAME}
                    '''
            }
        }
        stage('install terraform'){
            steps{
                sh '''
                    
                    bash ./scripts/terraform-install.sh
                    '''
            }
        }
        stage('run terraform'){
            steps{
                sh '''
                    export ARM_SUBSCRIPTION_ID=${ARM_SUBSCRIPTION_ID}
                    export ARM_TENANT_ID=${ARM_TENANT_ID}
                    bash ./scripts/terraform-setup.sh

                    '''
            }
        }
        stage('install maven'){
            steps{
                sh '''
                    bash ./scripts/mvnw-install.sh
                    '''
            }
        }
        stage('testing'){
            steps{
                sh '''
                    bash ./scripts/testing.sh
                    '''
            }
        }
        stage('aks auth'){
            steps{
                sh'''
                    az aks get-credentials --name cluster-aks1 --resource-group devops-final-terraform
                    '''
            }
        }
        stage('Build and push containers'){
            steps{
                sh'''
                    docker build -t "${ACR_LOGIN_NAME}.azurecr.io/spring-petclinic-angular:latest ./spring-petclinic-angular/"
                    docker push "${ACR_LOGIN_NAME}.azurecr.io/spring-petclinic-angular:latest"

                    docker build -t "${ACR_LOGIN_NAME}.azurecr.io/spring-petclinic-rest:latest ./spring-petclinic-rest/"
                    docker push "${ACR_LOGIN_NAME}.azurecr.io/spring-petclinic-rest:latest"
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
    post{
        always{
            jacoco classPattern: 'spring-petclinic-rest/target/classes', 
            exclusionPattern: 'spring-petclinic-rest/target/test-calsses', 
            execPattern: 'spring-petclinic-rest/target/jacoco.exec', 
            runAlways: true
        }
    }
}   
