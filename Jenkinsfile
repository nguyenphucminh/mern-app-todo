pipeline {
    agent any

    environment {
        DEPLOY_PATH = '/root/mern-app-todo'
    }

    stages {
        stage('Deploy to server via SSH') {
            steps {
                withCredentials([
                    string(credentialsId: 'SERVER_HOST', variable: 'SERVER_HOST'),
                    string(credentialsId: 'MONGO_URI', variable: 'MONGO_URI'),
                    string(credentialsId: 'PORT_BE', variable: 'PORT_BE'),
                    string(credentialsId: 'JWT_SECRET', variable: 'JWT_SECRET'),
                    string(credentialsId: 'REACT_APP_BE_API_URL', variable: 'REACT_APP_BE_API_URL'),

                    sshUserPrivateKey(
                        credentialsId: 'SERVER_SSH_KEY',
                        keyFileVariable: 'SSH_KEY',
                        usernameVariable: 'SERVER_USER'
                    )
                ]) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no -i ${SSH_KEY} ${SSH_USER}@${VPS_IP} "
                        cd ${DEPLOY_PATH} && \
                        git pull origin main && \

                        cat > .env << EOF
                        MONGO_URI=${MONGO_URI}
                        PORT_BE=${PORT_BE}
                        JWT_SECRET=${JWT_SECRET}
                        REACT_APP_BE_API_URL=${REACT_APP_BE_API_URL}
                        EOF

                        docker-compose down && \
                        docker-compose build && \
                        docker-compose up -d
                        "
                    '''
                }
            }
        }
    }
}