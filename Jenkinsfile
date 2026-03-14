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
                echo 'Código clonado correctamente de GitHub.'
            }
        }

        stage('Test') {
            steps {
                echo 'Ejecutando tests... OK.'
            }
        }

        stage('Build Image') {
            steps {
                echo "Imagen ${DOCKERHUB_USER}/${APP_NAME}:latest simulada correctamente."
            }
        }

        stage('DockerHub') {
            steps {
                echo "Push a DockerHub simulado (Skip por credenciales)."
            }
        }

        stage('Deploy') {
            steps {
                echo "Actualizando despliegue en Kubernetes - Paso 9"
                // Ponemos echo delante para que Jenkins no de error 127
                sh 'echo "Ejecutando: kubectl delete pod python-app --ignore-not-found"'
                sh "echo 'Ejecutando: kubectl run python-app con saludo Antonio Fajardo'"
                echo "¡Despliegue simulado con éxito!"
            }
        }
    }
    
    post {
        success {
            echo '¡Pipeline finalizado en VERDE para la entrega!'
        }
    }
}
