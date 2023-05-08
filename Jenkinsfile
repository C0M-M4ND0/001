pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'building...'
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'testing...'
                sh 'npm run test'
            }
        }
        stage('Build Docker Image') {
            when {
                currentBuild.result == 'SUCCESS'
            }
            steps {
                echo 'building docker image...'
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                        sh 'docker build -t 001:001 .'
                        sh 'docker push 001:001'
                    }  
                }
            }

        }
    }
}