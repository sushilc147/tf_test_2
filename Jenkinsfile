pipeline {
  environment {
    registry = "my-image/sushil"
    customImage = ''
	
  }
  agent {
    dockerfile {
		 filename 'Dockerfile'
		 reuseNode false
	 }
  }
  
  stages {
    stage('plan') {
	   steps {
			withCredentials([[
				$class: 'AmazonWebServicesCredentialsBinding',
				credentialsId: 'sushilAwsCredentials',
				accessKeyVariable: 'AWS_ACCESS_KEY_ID',
				secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
			]]) {
					sh 'echo `date`'
					sh 'echo `date`'
					sh 'echo $AWS_ACCESS_KEY_ID'
					sh 'echo $AWS_SECRET_ACCESS_KEY'
					sh 'echo `pwd`'
					sh 'terraform init -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY}'	
					sh 'terraform plan -var accessKey=${AWS_ACCESS_KEY_ID} -var secretKey=${AWS_SECRET_ACCESS_KEY}'
				}
			
		}
	}
   
  }
}
