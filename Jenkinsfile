pipeline {
  triggers {
    githubPush()
  }

  agent any

  stages {
    stage('Test') {
      steps {
        echo "Webhook triggered build!123"
      }
    }
    stage('for the fix branch') {
      when {
        branch "fix-*"
      }
      steps {
        sh '''
          cat README.md
        '''
      }
    }
    stage('for the PR') {
      when {
        branch "PR-*"
      }
      steps {
        echo 'this only runs for the PRs'
      }
    }    
  }
}
