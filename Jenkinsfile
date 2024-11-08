pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone the Git repository
                git 'https://github.com/Viswaraje/finallab.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the multi-stage Dockerfile
                    bat 'docker build -t myfrontend-app .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Add any testing commands here (if applicable)
                    echo 'Running tests (if any)'
                    // For example, run some JavaScript linting or testing tools
                    // bat 'npm run test'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the Docker container to a local or cloud container
                    bat 'docker run -d -p 80:80 myfrontend-app'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deploy completed successfully'
        }
        failure {
            echo 'Build or deploy failed'
        }
    }
}
