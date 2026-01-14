pipeline {
    agent any

    environment {
        IMAGE_NAME = "dilshad007/myapp"
        TAG = "latest"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/myapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$TAG ."
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKER_PASS')]) {
                    sh """
                      echo $DOCKER_PASS | docker login -u dilshad007 --password-stdin
                      docker push $IMAGE_NAME:$TAG
                    """
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh """
                  kubectl apply -f k8s/deployment.yaml
                  kubectl apply -f k8s/service.yaml
                """
            }
        }
    }
}
