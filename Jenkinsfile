pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                bat 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
		stage('Deploying to staging') {
			steps{
				build job:'DeployingTomcat'
			}
		}
		
		stage('Deploying to prod') {
			steps{
				timeout(time:5,unit:'DAYS'){
					input message:'APrrove production deployment'
				}
				build job:'deploy-to-prod'
			}
			post{
				success{
					echo 'code deployed successsfully'
				}
				failure {
					echo 'code deployment failed'
				}
			}
		}
    }
}
