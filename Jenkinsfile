pipeline {
    agent any
    
    environment {
        
        DOCKER_IMAGE = "MayurM21/node_app"
        TAG = "$env.BUILD_NUMBER"
    }
    
    stages {
        
        stage ('clone_repo'){
            
            steps {
                
               sh "git clone 'https://github.com/mayur968574/node-hello.git'"
                
            }
            
        }
        
        stage ('build') {
            
            steps {
                
                sh 'npm install'
                
            }
            
            
        }
        
        stage ('run_tests') {
            
            steps {
                
                sh 'npm test'
                
            }
            
            
        }
        
        stage ('Docker_image') {
            
            steps {
                
                sh 'docker build -t $DOCKER_IMAGE:TAG' 
                
            }
            
        }
        
        stage ('push_docker_image') {
            
            steps {
                withCredentials([usernamePassword(credentialId: 'dockerhub-creds', usernameVaraible: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')])
                
                {
            
            sh ''' 
                echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                docker push $DOCKER_IMAGE:$TAG
                
                '''    
                            }
            }
        }
                            
        stage ('Deploy') {
            
            steps {
                                                   
                    sh '''                        
                        docker pull $DOCKER_IMAGE': $TAG && 
                        docker run -d --name node_app -p 3000:3000 $DOCKER_IMAGE:1.0
                        
                        '''
                    
                        
                    }
            
            
            }
    
    }
    
}
