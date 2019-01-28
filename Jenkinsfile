pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        echo 'Hello World'
        git(url: 'https://github.com/bponath/ecs-demo-php-simple-app', branch: 'master'),
      }
    }
  }
}