pipeline {
    agent any 
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
        AWS_ACCESS_KEY_ID = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    stages {
        stage('terraform init and apply - dev') {
            steps {
                sh returnStatus: true, script: 'terraform workspace new dev'
                sh "terraform init"
                sh "terraform apply -var-file=dev.tfvars -auto-approve"
            }
        }
        stage('terraform init and apply - prod') {
            steps {
                sh returnStatus: true, script: 'terraform workspace new prod'
                sh "terraform init"
                sh "terraform apply -var-file=prod.tfvars -auto-approve"
            }
        }
    }
}

def getTerraformPath () {
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}