pipeline {
  agent none
  stages {
    stage('Deploy') {
      agent any
      steps {
        echo 'Deploying'
        sh './deploy_jenkins.sh'
      }
    }
  }
}
