pipeline {
    agent any

    stages {

        // 1️⃣ Clone the GitHub repo
        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/myapp.git',
                    credentialsId: 'my-token'
            }
        }

        // 2️⃣ Build the Docker image
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t python-hello-world .'
            }
        }

        // 3️⃣ Run the Docker container locally
        stage('Run on Docker') {
            steps {
                bat '''
                docker rm -f python-app 2>nul
                docker run -d --name python-app -p 5000:5000 python-hello-world
                '''
            }
        }

        // 4️⃣ Push Docker image to Docker Hub
        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASSWORD')]) {
                    bat '''
                    echo %DOCKER_PASSWORD% | docker login -u dilshad007 --password-stdin
                    docker tag python-hello-world dilshad007/python-hello-world:latest
                    docker push dilshad007/python-hello-world:latest
                    '''
                }
            }
        }

        // 5️⃣ Deploy to Kubernetes
        stage('Deploy to Kubernetes') {
            steps {
                // Assumes kubectl is installed and kubeconfig is available on Jenkins agent
                bat '''
                kubectl set image deployment/python-app-deployment python-app=dilshad007/python-hello-world:latest --record
                kubectl rollout status deployment/python-app-deployment
                '''
            }
        }

    }
}
