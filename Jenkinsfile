pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/myapp.git',
                    credentialsId: 'my-token'
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
                docker stop python-app || exit 0
                docker rm python-app || exit 0
                docker run -d --name python-app -p 5000:5000 python-hello-world
                '''
            }
        }
    }
}

