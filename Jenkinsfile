pipeline {
    agent any

    environment {
        IMAGE_NAME = "dockerhubusername/myapp"
        IMAGE_TAG  = "latest"
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
                bat """
                docker build -t %IMAGE_NAME%:%IMAGE_TAG% .
                """
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'dilshadashraf007',
                    passwordVariable: 'dckr_pat_4-IvbT4FLVxuyj-zYsRieb-dBSA'
                )]) {
                    bat """
                    echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                    """
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                bat """
                docker push %IMAGE_NAME%:%IMAGE_TAG%
                """
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat """
                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml
                """
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
