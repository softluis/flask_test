def ip = 'teste'
def link = 'http://'
def porta = ':5000'

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
				script{	
				//sh "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask"
				
					
					ip = sh(returnStdout: true, script: "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask").trim()
					//sh 'docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask; echo $? > status'
					//def r = readFile('status').trim()
				
					
				//IP = sh "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nomeflask"
					sh "echo ${ip}"
					sh "echo ${link}"
					sh "echo ${porta}"
				
					result = sh(returnStdout: true, script: "echo $link$ip$porta").trim()
					
					sh "echo '${result}'"
					
					
					//sh(script: "echo", args: ["hello", "world", env.MY_ENV, my_other_def])
					container = sh(returnStdout: true, script:"curl -o -I -L -s -w \"%{http_code}\n\" ${result}").trim()
					sh "echo '${container}'"
					sh "echo '${container}'"
					
					if (container == '200' ){ 
						println('Container Saudavel')
						}
					else {
						println('Erro no Container')
						}
					
				}
		}		
			
        } 
        
    }
    post {
        always {
            deleteDir()
        }
    }     
}
