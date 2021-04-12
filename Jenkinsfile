pipeline {
    agent any
    
    parameters { 
         string(name: 'tomcat_dev', defaultValue: '3.85.148.209', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '35.168.2.91', description: 'Production Server')
         string(name: 'Senthil_M', defaultValue: '"C:/Users/Senthil M/tomcat-demo.pem"', description: 'Folder')
    } 
 
    triggers {
         pollSCM('* * * * *') // Polling Source Control
     }
 
stages{
        stage('Build'){
            steps {
                 bat'mvn clean package'
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
                        bat "scp -i ${params.Senthil_M} **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        bat "scp -i ${params.Senthil_M} **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat/webapps"
                    }
                }
            }
        }
    }
}