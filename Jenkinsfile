pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        echo 'Checking out master'
        git(url: 'https://github.com/bponath/ecs-demo-php-simple-app', branch: 'master')
      }
    }
    stage('BuildImage') {
      steps {
        echo 'Building image'
        sh 'printenv'
      }
    }
  }
}