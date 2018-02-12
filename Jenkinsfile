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
			agent {
				docker {
                   	container_name: flask_Container
  			image: flask_app
               }
            }
			steps {
               echo 'done'
            }

        }
		stage('test container') {
			steps {
				sh 'echo exit | telnet localhost 5000'
			}
        } 
        
    }
    post {
        always {
            deleteDir()
        }
    }     
}
