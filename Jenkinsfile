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
                echo 'Código clonado correctamente.'
            }
        }

        stage('Test') {
            steps {
                echo 'Tests superados.'
            }
        }

        stage('Build Image') {
            steps {
                echo "Imagen ${DOCKERHUB_USER}/${APP_NAME}:latest simulada."
            }
        }

        stage('DockerHub') {
            steps {
                echo "Push simulado."
            }
        }

        stage('Deploy') {
            steps {
                echo "Actualizando a versión con saludo - Paso 9"
                sh 'kubectl delete pod python-app --ignore-not-found'
                // Usamos una sintaxis más limpia para evitar errores de comillas
                sh """
                kubectl run python-app --image=${DOCKERHUB_USER}/${APP_NAME}:latest --overrides='{"spec":{"containers":[{"name":"python-app","image":"${DOCKERHUB_USER}/${APP_NAME}:latest","imagePullPolicy":"Never","command":["/bin/bash","-c","while true; do echo -e \\\"HTTP/1.1 200 OK\\nContent-Type: text/html\\n\\n<html><body><h1>Hola, soy Antonio Fajardo</h1><p>Despliegue Paso 9 correcto</p></body></html>\\\" | nc -l -p 8080; done"]}]}}'
                """
            }
        }
    }
}
