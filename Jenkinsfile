pipeline {
    agent any
    
    parameters { 
         string(name: 'tomcat_dev', defaultValue: '3.85.148.209', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '35.168.2.91', description: 'Production Server')
         string(name: 'Senthil_M', defaultValue: '"c:/Users/Senthil M/tomcat-demo.pem"', description: 'Filepath of pem') 
    } 
    
    
 
    triggers {
         pollSCM('* * * * *') // Polling Source Control
     } 
 
 
stages{
        stage('Build'){
            steps {
               echo '######################################## Build'
                bat 'mvn clean package'
                bat ""docker build . -t tomcatwebapp:${env.BUILD_ID}"
            }
          
        }
 
       
    }
}