pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git url: 'https://github.com/Viswaraje/finallab.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with multi-stage Dockerfile
                    docker.build('react-frontend:latest', '.')
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside the Docker container (assuming npm test exists)
                    echo 'Running tests inside Docker container...'
                    docker.image('react-frontend:latest').inside {
                        // Run tests inside the container
                        sh 'npm test' // Replace with your test command
                    }
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    // Run the container and map port 80 inside the container to port 8081 on the host
                    docker.image('react-frontend:latest').run('-p 8081:80')
                }
            }
        }
    }
    post {
        always {
            cleanWs() // Clean up the workspace after the pipeline run
        }
    }
}
