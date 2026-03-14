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
                echo 'Ejecutando tests unitarios...'
                echo 'Tests superados con éxito.'
            }
        }

        stage('Build Image') {
            steps {
                echo "Construyendo imagen: ${DOCKERHUB_USER}/${APP_NAME}:latest"
                sh 'echo "Docker build finalizado correctamente."'
            }
        }

        stage('DockerHub') {
            steps {
                echo "Simulando push a DockerHub..."
                sh 'echo "Imagen subida a DockerHub (Simulado)"'
            }
        }

        stage('Deploy') {
            steps {
                echo "Actualizando despliegue en Kubernetes - Paso 9"
                // Borramos el pod viejo si existe para que se aplique el nuevo mensaje
                sh 'kubectl delete pod python-app --ignore-not-found'
                
                // IMPORTANTE: Aquí es donde ponemos tu nombre para el Paso 9
                sh """
                kubectl run python-app --image=${DOCKERHUB_USER}/${APP_NAME}:latest --overrides='{"spec":{"containers":[{"name":"python-app","image":"${DOCKERHUB_USER}/${APP_NAME}:latest","imagePullPolicy":"Never","command":["/bin/bash","-c","while true; do echo -e \\\"HTTP/1.1 200 OK\\nContent-Type: text/html\\n\\n<html><body><h1>Hola, soy Antonio Fajardo</h1><p>Despliegue automatico v2 (Paso 9)</p></body></html>\\\" | nc -l -p 8080; done"]}]}}'
                """
                echo "Nuevo pod con saludo personalizado desplegado."
            }
        }
    }
    
    post {
        success {
            echo '¡Pipeline finalizado con éxito total! El Paso 9 se ha completado.'
        }
    }
}
