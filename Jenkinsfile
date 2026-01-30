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

        stage('Deploy via SSH') {
            steps {
                sshagent(['0a550b1c-a900-4177-885b-afe8cc7ac0ce']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no root@69.62.125.52"

                            cd /srv/applications &&
                            git run -p 8082:80 valensniyonkuru/ci_cd_web:latest
                        "
                    '''
                }}
            }
        }
    }
