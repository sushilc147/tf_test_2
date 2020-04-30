pipeline {
  environment {
    registry = "my-image/sushil"
    customImage = ''
	
  }
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/gvsubbareddy/tf_test_2.git', branch: 'master', credentialsId: '12345-1234-4696-af25-123455'])
      }
    }
    stage('Building image') {
      steps{
        script {
          def customImage = docker.build(registry+":${env.BUILD_ID}")
        }
      }
    }
    stage('deploy') {
	   steps {
			script {
				customImage.inside {
					   sh 'echo $AWS_ACCESS_KEY_ID'
				}		    
			}
			
		}
	}
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_ID"
      }
    }
  }
}
