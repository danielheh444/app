pipeline {
	agent any

	environment {
	   IMAGE_NAME = "nginx"
	   CONTAINER_NAME = "dev-test"
	   PORT = "80:80"		
        }
	
	
	stages {
           stage('Build Docker File') {
              steps {
                 docker.build("${IMAGE_NAME}:${env.BUILD_ID}")
		}
	}
		
	
	   stage('Stop Old Container') {
	      steps {
		 sh '''
		 if [ \$(docker ps -q -f name=${CONTAINER_NAME}) ]; then
                        docker stop ${CONTAINER_NAME}
                        docker rm ${CONTAINER_NAME}
		 fi
		 '''			
		}
	}


	   stage('Run Container'){
	      steps {
		sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT} ${IMAGE_NAME}:${env.BUILD_ID}"
		}   
	}

           stage('Delete all images'){
              steps {
		sh "docker image prune -f"
                }
        }
    }
}







