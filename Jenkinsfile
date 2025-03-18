 pipeline {
	agent any
	
	environment {
		GITHUB_REPO = 'https://github.com/nekkantijetendrakumar/todo-application.git'
		DOCKER_IMAGE = 'jetendranekkanti/todo-application'
	}

	stages {
		stage( 'Clone Repository') {
			steps {
				git branch: 'master', credentialsId: 'github-credentials', url: "${GITHUB_REPO}"
			}
		}
		stage('BUild Docker Image'){
			steps {
				sh 'docker build -t ${DOCKER_IMAGE}:latest .'
			}
		}
		
		stage('Push to Docker Hub')
			steps {
				withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
					sh 'docker push ${DOCKER_IMAGE}:latest'
				}
			}
		}
		stage('Deploy Container') {
			steps {
				sh 'docker run -dp 8082:8081 ${DOCKER_IMAGE}:latest'
			}
		}
	}
 }
