pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dilshadashraf007/myapp.git',
                    credentialsId: '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'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t python-hello-world .'
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker run --rm python-hello-world'
            }
        }
    }
}
