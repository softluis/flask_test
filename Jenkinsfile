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
				Teste = sh (docker inspect -f {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} nomeflask)
				sh 'curl -o -I -L -s -w "%{http_code}\n" ${Teste}'
				
			}
        } 
        
    }
    post {
        always {
            deleteDir()
        }
    }     
}
