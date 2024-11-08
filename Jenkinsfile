pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/rohit-vr/devops_practicals.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the tag 'react-frontend:latest'
                    docker.build('react-frontend:latest', '.')
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    // Correct way to run the Docker container with port mapping
                    docker.image('react-frontend:latest').run('-p 8081:80')
                }
            }
        }
    }
    post {
        always {
            // Clean up the workspace after the pipeline run
            cleanWs()
        }
    }
}
