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
        sh '''
            printenv
            export AWS_DEFAULT_REGION=us-east-1
            $(aws ecr get-login --no-include-email --region us-east-1)
            docker build -t docker-ci-test:$GIT_COMMIT .
            docker tag docker-ci-test:$GIT_COMMIT 574233067113.dkr.ecr.us-east-1.amazonaws.com/ecsbl-repos-1bi6yqfr6rvyf:$GIT_COMMIT
            docker push 574233067113.dkr.ecr.us-east-1.amazonaws.com/ecsbl-repos-1bi6yqfr6rvyf:$GIT_COMMIT
        '''
      }
    }
    stage('Approval') {
      input message: 'Approve deployment?'
      milestone()
      steps {
        echo 'Deploying'
      }
    }
    stage('BuildApproved') {
      steps {
        echo 'Build approved'
      }
    }
  }
}