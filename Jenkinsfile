pipeline {
  agent any
  stages {
    stage('') {
      steps {
        sh '''kolla-ansible -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml bootstrap-servers
kolla-ansible -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml prechecks
kolla-ansible -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml deploy '''
      }
    }
  }
}