pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'antoniofajardo'
        APP_NAME = 'proyecto-ci-cd-antonio'
    }

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                // Ponemos un echo para que la etapa no esté vacía y no dé error
                echo 'Saltando tests temporalmente...'
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build -t ${DOCKERHUB_USER}/${APP_NAME}:latest ."
            }
        }

        stage('DockerHub') {
            steps {
                sh "docker push ${DOCKERHUB_USER}/${APP_NAME}:latest"
            }
        }

        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
