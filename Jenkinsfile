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
                 		sh 'docker run -d --name nomeflask flask_app -p 5000:5000'
			
            	} 
            }
		stage('test container') {
			steps {
				echo 'Testing....'
			}
        } 
        
    }
    post {
        always {
            deleteDir()
        }
    }     
}
