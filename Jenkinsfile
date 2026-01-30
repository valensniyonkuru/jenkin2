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
                sh 'docker build -t valensniyonkuru/ci_cd_web .'
            }
        }

        stage('login Dockerhub') {
            steps {
                script {
                    // login in dockerhub
                    sh 'docker login -u valensniyonkuru -p 1234567890'
                    sh 'docker push valensniyonkuru/ci_cd_web'
                }
            }
        }

        // stage('Docker Run') {
        //     steps {
        //         // Runs your newly built container on port 8080
        //         sh 'docker run -d -p 8081:80 --name webcontainer ci_cd_web'
        //     }
        // }
    }
}