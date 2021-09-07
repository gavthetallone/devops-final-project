pipeline{

    agent any
    
    stages{
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
    post{
        always{
            cobertura autoUpdateHealth: false,
            autoUpdateStability: false,
            coberturaReportFile: 'magic8ball/coverage.xml',
            conditionalCoverageTargets: '70, 0, 0',
            enableNewApi: true,
            failUnhealthy: false,
            failUnstable: false,
            lineCoverageTargets: '80, 0, 0',
            maxNumberOfBuilds: 0,
            methodCoverageTargets:
            '80, 0, 0', onlyStable:
            false, sourceEncoding: 'ASCII',
            zoomCoverageChart: false
        }
    }
}   
