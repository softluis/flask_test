pipeline {
    agent any  
    stages{
        stage('Build Docker Image ') {
            agent {
                dockerfile { 
                    reuseNode true                     
                    filename 'Dockerfile'
                    dir '.'
                    additionalBuildArgs '-t flask_app'
                }
            }
            steps {
                echo 'ls'
            }
		}
		stage('create container'){
			 steps {
                 		sh 'docker run --name nomeflask flask_app 5000:5000 && echo exit'
			
            	} 
            }
		stage('test container') {
			steps {
				sh 'telnet localhost 5000'
			}
        } 
        
    }
    post {
        always {
            deleteDir()
        }
    }     
}
