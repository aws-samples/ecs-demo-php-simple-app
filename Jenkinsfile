pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/bponath/ecs-demo-php-simple-app', branch: 'master')
      }
    }
  }
}