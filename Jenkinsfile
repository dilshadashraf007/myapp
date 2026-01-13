pipeline {
    agent any

    environment {
        IMAGE_NAME = "python-hello-world"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/myapp.git'
                    // credentialsId removed since repo is public
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker', // ID of your Jenkins Docker credential
                    usernameVariable: 'dilshadashraf007', // variable name for username
                    passwordVariable: 'docker password'  // 
                )]) {
                    // Debug: make sure variables exist
                    bat 'echo DOCKER_USER=%DOCKER_USER%'
                    bat 'echo length of DOCKER_PASS=%DOCKER_PASS:~0,1%' 

                    // Use pipe login for Windows to handle special characters
                    bat 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'

                    // Tag and push
                    bat 'docker tag %IMAGE_NAME% %DOCKER_USER%/%IMAGE_NAME%:latest'
                    bat 'docker push %DOCKER_USER%/%IMAGE_NAME%:latest'
                }
            }
        }
    }
}
