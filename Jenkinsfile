pipeline {
    agent any

    environment {
        REGISTRY = '192.168.12.104:5050'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/vanitoo/document-xml-processor.git', credentialsId: 'github-creds'
            }
        }

        // Читаем версию ПОСЛЕ checkout
        stage('Set Version') {
            steps {
                script {
                    env.VERSION = readFile('VERSION').trim()
                    echo "Using version: ${VERSION}"
                }
            }
        }

        // -------- FILE WATCHER --------
        stage('Build: file_watcher') {
            steps {
                sh "docker build -t file_watcher:${VERSION} -f Dockerfile-file_watcher ."
            }
        }

        stage('Tag: file_watcher') {
            steps {
                sh """
                    docker tag file_watcher:${VERSION} ${REGISTRY}/file_watcher:${VERSION}
                    docker tag file_watcher:${VERSION} ${REGISTRY}/file_watcher:latest
                """
            }
        }

        stage('Push: file_watcher') {
            steps {
                sh """
                    docker push ${REGISTRY}/file_watcher:${VERSION}
                    docker push ${REGISTRY}/file_watcher:latest
                """
            }
        }

        // -------- PDF PROCESSOR --------
        stage('Build: pdf_processor') {
            steps {
                sh "docker build -t pdf_processor:${VERSION} -f Dockerfile-pdf_processor ."
            }
        }

        stage('Tag: pdf_processor') {
            steps {
                sh """
                    docker tag pdf_processor:${VERSION} ${REGISTRY}/pdf_processor:${VERSION}
                    docker tag pdf_processor:${VERSION} ${REGISTRY}/pdf_processor:latest
                """
            }
        }

        stage('Push: pdf_processor') {
            steps {
                sh """
                    docker push ${REGISTRY}/pdf_processor:${VERSION}
                    docker push ${REGISTRY}/pdf_processor:latest
                """
            }
        }

        // -------- XSLT PROCESSOR --------
        stage('Build: xslt_processor') {
            steps {
                sh "docker build -t xslt_processor:${VERSION} -f Dockerfile-xslt_processor ."
            }
        }

        stage('Tag: xslt_processor') {
            steps {
                sh """
                    docker tag xslt_processor:${VERSION} ${REGISTRY}/xslt_processor:${VERSION}
                    docker tag xslt_processor:${VERSION} ${REGISTRY}/xslt_processor:latest
                """
            }
        }

        stage('Push: xslt_processor') {
            steps {
                sh """
                    docker push ${REGISTRY}/xslt_processor:${VERSION}
                    docker push ${REGISTRY}/xslt_processor:latest
                """
            }
        }

        // -------- API PROCESSOR --------
        stage('Build: api_processor') {
            steps {
                sh "docker build -t api_processor:${VERSION} -f Dockerfile-api_processor ."
            }
        }

        stage('Tag: api_processor') {
            steps {
                sh """
                    docker tag api_processor:${VERSION} ${REGISTRY}/api_processor:${VERSION}
                    docker tag api_processor:${VERSION} ${REGISTRY}/api_processor:latest
                """
            }
        }

        stage('Push: api_processor') {
            steps {
                sh """
                    docker push ${REGISTRY}/api_processor:${VERSION}
                    docker push ${REGISTRY}/api_processor:latest
                """
            }
        }
    }

    post {
        always {
            echo '=== Jenkins Pipeline завершён ==='
        }
    }
}
