pipeline {
    agent any 
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
        AWS_ACCESS_KEY_ID = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    stages {
        stage ('S3 - creatre Bucket') {
            steps {
                script {
                    createS3Bucket('bindrill-1238')
                }
            }
        }
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

def createS3Bucket (bucketName) {
    sh returnStatus: true, script: "aws s3 mb ${bucketName} --region=us-west-1"
}