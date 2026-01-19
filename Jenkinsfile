pipeline {
    agent any

    environment {
        IMAGE_NAME = "dilshadashraf007/python-app"
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
                bat "docker build -t %IMAGE_NAME%:%BUILD_NUMBER% ."
                bat "docker tag %IMAGE_NAME%:%BUILD_NUMBER% %IMAGE_NAME%:latest"
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    bat '''
                    echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                    '''
                }
            }
        }

      stage('Push Docker Image') {
    steps {
        bat "docker push %IMAGE_NAME%:%BUILD_NUMBER%"
        bat "docker push %IMAGE_NAME%:latest"
    }
}
   stage('Deploy to Kubernetes') {
    steps {
        withCredentials([file(credentialsId: env.KUBE_CONFIG_CREDENTIALS, variable: 'KUBECONFIG_FILE')]) {
            bat '''
            set KUBECONFIG=%KUBECONFIG_FILE%
            kubectl create deployment python-app-deployment --image=%IMAGE_NAME%:%BUILD_NUMBER% --dry-run=client -o yaml | kubectl apply -f -
            kubectl expose deployment python-app-deployment --type=LoadBalancer --port=80 --target-port=80 --dry-run=client -o yaml | kubectl apply -f -
            kubectl rollout status deployment/python-app-deployment
            '''
        }
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
