pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ci/cd_web .'
            }
        }
        stage('Cleanup Old Container') {
            steps {
                script {
                    // MUST match the name used in the 'Run' stage below
                    sh 'docker stop webcontainer || true'
                    sh 'docker rm webcontainer || true'
                }
            }
        }
        stage('Docker Run') {
            steps {
                // Mapping container port 80 to host port 8081
                sh 'docker run -d -p 8081:80 --name webcontainer ci/cd_web'
            }
        }
    }
}
