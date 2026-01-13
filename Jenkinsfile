pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/myapp.git',
                    credentialsId: 'git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t python-hello-world .'
            }
        }

        stage('Run on Docker') {
            steps {
                bat '''
                docker rm -f python-app 2>nul
                docker run -d --name python-app -p 5000:5000 python-hello-world
                '''
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'dilshadashraf007',
                    passwordVariable: 'dckr_pat_-YgmSrDQG599-UK1ARunjXrWNr0'
                )]) {
                    bat '''
                    echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                    docker tag python-hello-world %DOCKER_USER%/python-hello-world:latest
                    docker push %DOCKER_USER%/python-hello-world:latest
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat '''
                kubectl set image deployment/python-app-deployment python-app=%DOCKER_USER%/python-hello-world:latest --record
                kubectl rollout status deployment/python-app-deployment
                '''
            }
        }
    }
}
