pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone the Git repository
                git 'https://github.com/Viswaraje/finallab.git'
            }
        }

        stage('Login to Docker') {
            steps {
                script {
                    // Login to Docker registry using your specific Docker credentials
                    withCredentials([usernamePassword(credentialsId: 'docker-viswaraje', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        bat "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    }
                }
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

        stage('Push to Docker Registry') {
            steps {
                script {
                    // Push the Docker image to a Docker registry
                    bat "docker push myfrontend-app"
                }
            }
        }
    }

    post {
        success {
            echo 'Build, deploy, and push completed successfully'
        }
        failure {
            echo 'Build or deploy failed'
        }
    }
}
