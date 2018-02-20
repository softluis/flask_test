//def s = 'docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask'
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
				
				//sh "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask"
				
					
					//IP = $("docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask")
					//sh 'docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask; echo $? > status'
					//def r = readFile('status').trim()
					
					
				IP = sh (returnStdout: true ,
					script: "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask",
					
				).trim()
				
				sh 'curl -o -I -L -s -w "%{http_code}\n" ${IP}'
		}		
			
        } 
        
    }
    post {
        always {
            deleteDir()
        }
    }     
}
