pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the GitHub repository
                git 'https://github.com/Viswaraje/finallab.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image directly without using a variable
                powershell '''
                    docker build -t my-web-app-image .
                '''
            }
        }

        stage('Deploy') {
            steps {
                // Deploy Docker container directly without using a variable
                powershell '''
                    docker run -d -p 80:80 my-web-app-image
                '''
            }
        }
    }

    post {
        always {
            // Clean up Docker resources using PowerShell
            powershell '''
                docker system prune -f
            '''
        }
    }
}
