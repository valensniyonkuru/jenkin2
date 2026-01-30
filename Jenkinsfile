pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Jenkins usually does this automatically if using "Pipeline from SCM"
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                // Builds the image using the command you just verified
                sh 'docker build -t ci/cd_web .'
            }
        }

        stage('Cleanup Old Container') {
            steps {
                script {
                    // Stops and removes the container if it's already running to avoid name conflicts
                    sh 'docker stop my_nginx_container || true'
                    sh 'docker rm my_nginx_container || true'
                }
            }
        }

        stage('Docker Run') {
            steps {
                // Runs your newly built container on port 8080
                sh 'docker run -d -p 8081:80 --name webcontainer ci/cd_web'
            }
        }
    }
}
