    pipeline {
        agent any
        
        parameters { 
             string(name: 'tomcat_dev', defaultValue: '18.216.174.213', description: 'Staging Server')
             //string(name: 'tomcat_prod', defaultValue: '34.209.233.6', description: 'Production Server')
        } 
     
        triggers {
             pollSCM('* * * * *') // Polling Source Control
         }
     
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
     
            stage ('Deployments'){
               parallel{
                    stage ('Deploy to Staging'){
                        steps {
                            bat "pscp -scp -i /users/dchuda/Downloads/test.pem "C:\\Program Files (x86)\\Jenkins\\workspace\\Fullyautomated\\webapp\\target\\webapp.war" ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
                        }
                    }
     
                   // stage ("Deploy to Production"){
                      //  steps {
                       //     bat "winscp -i /home/jenkins/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
                       // }
                  //  }
                }
            }
        }
    }